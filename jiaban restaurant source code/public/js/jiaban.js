/* ============================================================
   加班 | JIABAN — Frontend Application v2
   ============================================================ */
'use strict';

// ── GLOBALS ──────────────────────────────────────────────────
let menuDataTable = null;
let categoryDataTable = null;
let allCategories = [];
let currentFilter = 'all';
let allMenuData = [];

// Category badge class map
const CAT_MAP = {
  'Appetizer / Starters': 'cb-1',
  'Snacks / Sides':       'cb-2',
  'Main Course':          'cb-3',
  'Kids Menu':            'cb-4',
  'Beverages / Drinks':   'cb-5',
  'Dessert':              'cb-6',
  'Soup':                 'cb-7',
};
function catClass(name) { return CAT_MAP[name] || 'cb-x'; }
function fmtPrice(p) { return 'IDR ' + parseInt(p).toLocaleString('id-ID'); }

// ── SWAL CONFIG ───────────────────────────────────────────────
const SWL = {
  customClass: { popup: 'js', title: 'js', htmlContainer: 'js' }
};
const ok  = (t, m) => Swal.fire({ ...SWL, icon:'success', title:t, text:m, timer:2100, showConfirmButton:false });
const err = (t, m) => Swal.fire({ ...SWL, icon:'error',   title:t||'Error', text:m||'Something went wrong.' });
const ask = (name, entity='item') => Swal.fire({
  ...SWL, icon:'warning',
  title: `Remove ${entity}?`,
  html: `<span style="color:var(--muted);font-size:13.5px;">This will permanently remove <strong style="color:var(--on-dark);">${name}</strong>.</span>`,
  showCancelButton: true, confirmButtonText: 'Delete', cancelButtonText: 'Cancel', reverseButtons: true
});

// ── NAVIGATION ────────────────────────────────────────────────
function showSection(name) {
  document.querySelectorAll('.page-section').forEach(s => s.classList.remove('active'));
  document.querySelectorAll('.nav-link, .mobile-nav-link').forEach(l => l.classList.remove('active'));

  const s = document.getElementById('section-' + name);
  if (s) s.classList.add('active');
  document.querySelectorAll(`[data-section="${name}"]`).forEach(l => l.classList.add('active'));

  closeMobileNav();

  if (name === 'dashboard')  initDashboard();
  if (name === 'menu')       initMenu();
  if (name === 'categories') initCategories();
  if (name === 'insights')   initInsights();
}

function toggleMobileNav() {
  document.getElementById('mobileNavDrawer').classList.toggle('open');
}
function closeMobileNav() {
  document.getElementById('mobileNavDrawer').classList.remove('open');
}

// ── MODAL HELPERS ─────────────────────────────────────────────
function openModal(id)  { document.getElementById(id).classList.add('open'); }
function closeModal(id) { document.getElementById(id).classList.remove('open'); }

document.querySelectorAll('.modal-backdrop').forEach(bd => {
  bd.addEventListener('click', e => { if (e.target === bd) bd.classList.remove('open'); });
});

// ── DASHBOARD ────────────────────────────────────────────────
function initDashboard() {
  $.get('/api/menu/stats/dashboard')
    .done(res => {
      if (!res.success) return;
      const d = res.data;
      countUp('statTotalMenu',   d.totalMenu);
      countUp('statTotalCat',    d.totalCategories);
      countUp('statTotalFood',   d.totalFood);
      countUp('statTotalDrinks', d.totalDrinks);

      // Collections grid
      const max = Math.max(...d.perCategory.map(c => c.total), 1);
      let html = '';
      d.perCategory.forEach(cat => {
        html += `
          <div class="collection-card" onclick="filterAndGoMenu('${cat.nama_kategori}')">
            <div class="collection-card-num">${cat.total}</div>
            <div class="collection-card-name">${cat.nama_kategori}</div>
            <div class="collection-card-badge">${cat.total} item${cat.total !== 1 ? 's' : ''}</div>
          </div>`;
      });
      document.getElementById('collectionsGrid').innerHTML = html;
    });
}

function countUp(id, target) {
  const el = document.getElementById(id);
  if (!el) return;
  let cur = 0;
  const step = Math.max(1, Math.ceil(target / 40));
  const t = setInterval(() => {
    cur = Math.min(cur + step, target);
    el.textContent = cur;
    if (cur >= target) clearInterval(t);
  }, 18);
}

function filterAndGoMenu(catName) {
  const hasSectionMenu = document.getElementById('section-menu');
  if (hasSectionMenu) {
    showSection('menu');
    setTimeout(() => {
      const btn = document.querySelector(`.mf-btn[data-catname="${catName}"]`);
      if (btn) btn.click();
    }, 120);
    return;
  }
  window.location.href = '/menu.html?category=' + encodeURIComponent(catName);
}

// ── CATEGORIES FETCH & SELECTS ────────────────────────────────
function loadCats(cb) {
  $.get('/api/categories').done(res => {
    if (!res.success) return;
    allCategories = res.data;
    fillCatSelects();
    if (cb) cb(res.data);
  });
}

function fillCatSelects() {
  ['#addMenuCategory','#editMenuCategory'].forEach(sel => {
    const $s = $(sel);
    const cur = $s.val();
    $s.empty();
    if (sel === '#addMenuCategory') $s.append('<option value="">Select category</option>');
    allCategories.forEach(c => $s.append(`<option value="${c.id}">${c.nama_kategori}</option>`));
    if (cur) $s.val(cur);
  });
}

// ── MENU PAGE ────────────────────────────────────────────────
function initMenu() {
  loadCats(cats => {
    buildMenuSubnav(cats);
    if (!menuDataTable) {
      buildMenuTable();
    } else {
      menuDataTable.ajax.reload(null, false);
    }
  });
}

function buildMenuSubnav(cats) {
  const $nav = $('#menuSubnav');
  // Clear dynamic buttons, keep 'All'
  $nav.find('.mf-btn:not([data-filter="all"])').remove();
  cats.forEach(c => {
    $nav.append(`<button class="mf-btn" data-filter="${c.id}" data-catname="${c.nama_kategori}" onclick="applyMenuFilter('${c.id}', this)">${c.nama_kategori}</button>`);
  });
}

function applyMenuFilter(filterId, btn) {
  document.querySelectorAll('.mf-btn').forEach(b => b.classList.remove('active'));
  btn.classList.add('active');
  currentFilter = filterId;

  if (!menuDataTable) return;

  if (filterId === 'all') {
    menuDataTable.column(3).search('').draw();
  } else {
    const catName = btn.dataset.catname || '';
    menuDataTable.column(3).search(catName, false, false).draw();
  }
}

function buildMenuTable() {
  menuDataTable = $('#menuTable').DataTable({
    ajax: { url: '/api/menu', dataSrc: 'data', error: () => err('Load Error') },
    columns: [
      { data: null, render: (d, t, r, m) => m.row + 1, orderable: false, width: '48px' },
      { data: 'nama_menu', render: d => `<span class="td-name">${d}</span>` },
      { data: 'harga', render: d => `<span class="td-price">${fmtPrice(d)}</span>` },
      { data: 'nama_kategori', render: d => `<span class="cb ${catClass(d)}">${d}</span>` },
      {
        data: 'id', orderable: false, render: (d, t, r) => `
          <div class="act-wrap">
            <button class="act-btn act-edit" onclick="openEditMenu(${d})" title="Edit">
              <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M11 4H4a2 2 0 00-2 2v14a2 2 0 002 2h14a2 2 0 002-2v-7"/><path d="M18.5 2.5a2.121 2.121 0 013 3L12 15l-4 1 1-4 9.5-9.5z"/></svg>
            </button>
            <button class="act-btn act-del" onclick="deleteMenu(${d},'${esc(r.nama_menu)}')" title="Delete">
              <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="3 6 5 6 21 6"/><path d="M19 6l-1 14H6L5 6"/><path d="M10 11v6M14 11v6"/><path d="M9 6V4h6v2"/></svg>
            </button>
          </div>`
      }
    ],
    pageLength: 15,
    lengthMenu: [10, 15, 25, 50, 100],
    dom: '<"dt-top"fl>rt<"dt-bot"ip>',
    language: {
      search: 'Search:', lengthMenu: 'Show _MENU_',
      info: '_START_–_END_ of _TOTAL_', infoEmpty: 'No results',
      paginate: { previous: '‹', next: '›' }
    }
  });
}

function esc(s) { return String(s).replace(/'/g, "\\'"); }

// ADD MENU
function openAddMenuModal() {
  loadCats();
  $('#addMenuForm')[0].reset();
  if ($('#addMenuForm').data('validator')) {
    $('#addMenuForm').validate().resetForm();
    $('#addMenuForm .ff').removeClass('error');
  }
  openModal('addMenuModal');
}

$('#addMenuForm').validate({
  rules: { nama_menu: { required: true, minlength: 2 }, harga: { required: true, number: true, min: 1000 }, kategori_id: { required: true } },
  messages: { nama_menu: { required: 'Name required' }, harga: { required: 'Price required', min: 'Min 1000' }, kategori_id: { required: 'Select a category' } },
  errorClass: 'error', errorElement: 'label',
  highlight: el => $(el).addClass('error'),
  unhighlight: el => $(el).removeClass('error'),
  submitHandler: () => {
    const d = { nama_menu: $('#addMenuName').val().trim(), harga: +$('#addMenuPrice').val(), kategori_id: +$('#addMenuCategory').val() };
    $.ajax({ url: '/api/menu', method: 'POST', contentType: 'application/json', data: JSON.stringify(d) })
      .done(res => {
        if (res.success) {
          closeModal('addMenuModal');
          ok('Item Added', `"${d.nama_menu}" added to the menu.`);
          if (menuDataTable) menuDataTable.ajax.reload(null, false);
          initDashboard();
        } else err('Error', res.message);
      }).fail(x => err('Error', x.responseJSON?.message));
  }
});

// EDIT MENU
function openEditMenu(id) {
  $.get('/api/menu/' + id).done(res => {
    if (!res.success) return err();
    const m = res.data;
    $('#editMenuId').val(m.id);
    $('#editMenuName').val(m.nama_menu);
    $('#editMenuPrice').val(m.harga);
    loadCats(() => { setTimeout(() => $('#editMenuCategory').val(m.kategori_id), 40); });
    openModal('editMenuModal');
  }).fail(() => err());
}

$('#editMenuForm').validate({
  rules: { nama_menu: { required: true, minlength: 2 }, harga: { required: true, number: true, min: 1000 }, kategori_id: { required: true } },
  errorClass: 'error', errorElement: 'label',
  highlight: el => $(el).addClass('error'),
  unhighlight: el => $(el).removeClass('error'),
  submitHandler: () => {
    const id = $('#editMenuId').val();
    const d = { nama_menu: $('#editMenuName').val().trim(), harga: +$('#editMenuPrice').val(), kategori_id: +$('#editMenuCategory').val() };
    $.ajax({ url: '/api/menu/' + id, method: 'PUT', contentType: 'application/json', data: JSON.stringify(d) })
      .done(res => {
        if (res.success) {
          closeModal('editMenuModal');
          ok('Updated', `"${d.nama_menu}" has been updated.`);
          if (menuDataTable) menuDataTable.ajax.reload(null, false);
          initDashboard();
        } else err('Error', res.message);
      }).fail(x => err('Error', x.responseJSON?.message));
  }
});

// DELETE MENU
function deleteMenu(id, name) {
  ask(name).then(r => {
    if (!r.isConfirmed) return;
    $.ajax({ url: '/api/menu/' + id, method: 'DELETE' })
      .done(res => {
        if (res.success) {
          ok('Removed', `"${name}" removed from the menu.`);
          if (menuDataTable) menuDataTable.ajax.reload(null, false);
          initDashboard();
        } else err('Error', res.message);
      }).fail(() => err());
  });
}


// ── CATEGORIES PAGE ──────────────────────────────────────────
function initCategories() {
  renderCategoryTable();
}

function renderCategoryTable() {
  const $table = $('#categoryTable');
  if (!$table.length) return;
  $table.closest('.table-panel').addClass('loading-state');

  $.when($.get('/api/categories'), $.get('/api/menu'))
    .done((catRes, menuRes) => {
      if (!catRes[0].success || !menuRes[0].success) return;
      allCategories = catRes[0].data;
      fillCatSelects();

      const items = menuRes[0].data || [];
      const counts = {};
      items.forEach(item => {
        counts[item.kategori_id] = (counts[item.kategori_id] || 0) + 1;
      });

      const rows = allCategories.map((cat, idx) => ({
        no: idx + 1,
        id: cat.id,
        nama_kategori: cat.nama_kategori,
        total_items: counts[cat.id] || 0
      }));

      if (categoryDataTable) {
        categoryDataTable.clear().rows.add(rows).draw();
      } else {
        categoryDataTable = $table.DataTable({
          data: rows,
          columns: [
            { data: 'no', width: '48px' },
            { data: 'nama_kategori', render: d => `<span class="cb ${catClass(d)}">${d}</span>` },
            { data: 'total_items', render: d => `<span class="td-price">${d} item${d !== 1 ? 's' : ''}</span>` },
            {
              data: 'id', orderable: false, render: (d, t, r) => `
                <div class="act-wrap">
                  <button class="act-btn act-edit" onclick="openEditCategory(${d},'${esc(r.nama_kategori)}')" title="Edit">
                    <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M11 4H4a2 2 0 00-2 2v14a2 2 0 002 2h14a2 2 0 002-2v-7"/><path d="M18.5 2.5a2.121 2.121 0 013 3L12 15l-4 1 1-4 9.5-9.5z"/></svg>
                  </button>
                  <button class="act-btn act-del" onclick="deleteCategory(${d},'${esc(r.nama_kategori)}')" title="Delete">
                    <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="3 6 5 6 21 6"/><path d="M19 6l-1 14H6L5 6"/><path d="M10 11v6M14 11v6"/><path d="M9 6V4h6v2"/></svg>
                  </button>
                </div>`
            }
          ],
          pageLength: 10,
          lengthMenu: [5, 10, 25, 50],
          dom: '<"dt-top"fl>rt<"dt-bot"ip>',
          language: {
            search: 'Search:', lengthMenu: 'Show _MENU_',
            info: '_START_–_END_ of _TOTAL_', infoEmpty: 'No results',
            paginate: { previous: '‹', next: '›' }
          }
        });
      }
    })
    .fail(() => err('Load Error', 'Unable to load categories.'))
    .always(() => $table.closest('.table-panel').removeClass('loading-state'));
}

function openAddCategoryModal() {

  $('#addCategoryForm')[0].reset();
  if ($('#addCategoryForm').data('validator')) {
    $('#addCategoryForm').validate().resetForm();
    $('#addCategoryForm .ff').removeClass('error');
  }
  openModal('addCategoryModal');
}

$('#addCategoryForm').validate({
  rules: { nama_kategori: { required: true, minlength: 2 } },
  errorClass: 'error', errorElement: 'label',
  highlight: el => $(el).addClass('error'),
  unhighlight: el => $(el).removeClass('error'),
  submitHandler: () => {
    const d = { nama_kategori: $('#newCategoryName').val().trim() };
    $.ajax({ url: '/api/categories', method: 'POST', contentType: 'application/json', data: JSON.stringify(d) })
      .done(res => {
        if (res.success) {
          closeModal('addCategoryModal');
          ok('Category Created', `"${d.nama_kategori}" added.`);
          renderCategoryTable();
        } else err('Error', res.message);
      }).fail(() => err());
  }
});

function openEditCategory(id, name) {
  $('#editCategoryId').val(id);
  $('#editCategoryName').val(name);
  openModal('editCategoryModal');
}

$('#editCategoryForm').validate({
  rules: { nama_kategori: { required: true, minlength: 2 } },
  errorClass: 'error', errorElement: 'label',
  highlight: el => $(el).addClass('error'),
  unhighlight: el => $(el).removeClass('error'),
  submitHandler: () => {
    const id = $('#editCategoryId').val();
    const d = { nama_kategori: $('#editCategoryName').val().trim() };
    $.ajax({ url: '/api/categories/' + id, method: 'PUT', contentType: 'application/json', data: JSON.stringify(d) })
      .done(res => {
        if (res.success) {
          closeModal('editCategoryModal');
          ok('Updated', `Category updated to "${d.nama_kategori}".`);
          renderCategoryTable();
          if (menuDataTable) menuDataTable.ajax.reload(null, false);
        } else err('Error', res.message);
      }).fail(() => err());
  }
});

function deleteCategory(id, name) {
  ask(name, 'category').then(r => {
    if (!r.isConfirmed) return;
    $.ajax({ url: '/api/categories/' + id, method: 'DELETE' })
      .done(res => {
        if (res.success) {
          ok('Removed', `"${name}" deleted.`);
          renderCategoryTable();
        } else err('Cannot Delete', res.message);
      }).fail(() => err());
  });
}

// ── INSIGHTS PAGE ────────────────────────────────────────────
function initInsights() {
  $.when(
    $.get('/api/menu/stats/dashboard'),
    $.get('/api/menu')
  ).done((statsRes, menuRes) => {
    if (!statsRes[0].success || !menuRes[0].success) return;
    const stats = statsRes[0].data;
    const items = menuRes[0].data;

    renderInsightsBreakdown(stats.perCategory);
    renderPriceRange(items);
    renderQuickStats(stats, items);
  });
}

function renderInsightsBreakdown(cats) {
  const max = Math.max(...cats.map(c => c.total), 1);
  let html = '';
  cats.forEach(c => {
    const pct = Math.round((c.total / max) * 100);
    html += `
      <div class="breakdown-row">
        <span class="breakdown-label">${c.nama_kategori}</span>
        <div class="breakdown-track"><div class="breakdown-fill" style="width:0" data-w="${pct}%"></div></div>
        <span class="breakdown-num">${c.total}</span>
      </div>`;
  });
  document.getElementById('insightsCategoryBreakdown').innerHTML = html;
  setTimeout(() => {
    document.querySelectorAll('.breakdown-fill').forEach(f => f.style.width = f.dataset.w);
  }, 80);
}

function renderPriceRange(items) {
  if (!items.length) return;
  const prices = items.map(i => i.harga);
  const min = Math.min(...prices), max = Math.max(...prices);
  const avg = Math.round(prices.reduce((a,b) => a+b, 0) / prices.length);
  const median = [...prices].sort((a,b)=>a-b)[Math.floor(prices.length/2)];
  document.getElementById('insightsPriceRange').innerHTML = `
    <div class="price-tier"><span class="price-tier-label">Lowest</span><span class="price-tier-val">${fmtPrice(min)}</span></div>
    <div class="price-tier"><span class="price-tier-label">Highest</span><span class="price-tier-val">${fmtPrice(max)}</span></div>
    <div class="price-tier"><span class="price-tier-label">Average</span><span class="price-tier-val">${fmtPrice(avg)}</span></div>
    <div class="price-tier"><span class="price-tier-label">Median</span><span class="price-tier-val">${fmtPrice(median)}</span></div>`;
}

function renderQuickStats(stats, items) {
  const sorted = [...items].sort((a,b) => b.harga - a.harga);
  const top = sorted[0];
  document.getElementById('insightsQuickStats').innerHTML = `
    <div class="qs-row"><span class="qs-label">Total Items</span><span class="qs-val">${stats.totalMenu}</span></div>
    <div class="qs-row"><span class="qs-label">Food Items</span><span class="qs-val">${stats.totalFood}</span></div>
    <div class="qs-row"><span class="qs-label">Beverages</span><span class="qs-val">${stats.totalDrinks}</span></div>
    <div class="qs-row"><span class="qs-label">Categories</span><span class="qs-val">${stats.totalCategories}</span></div>
    ${top ? `<div class="qs-row"><span class="qs-label">Highest Price</span><span class="qs-val">${fmtPrice(top.harga)}</span></div>` : ''}`;
}



// ── FORM PAGE ───────────────────────────────────────────────
function initFormPage() {
  loadPageFormCategories();
}

function loadPageFormCategories() {
  const $s = $('#pageMenuCategory');
  if (!$s.length) return;
  $.get('/api/categories').done(res => {
    if (!res.success) return;
    $s.empty().append('<option value="">Select category</option>');
    res.data.forEach(c => $s.append(`<option value="${c.id}">${c.nama_kategori}</option>`));
  });
}

if ($('#pageMenuForm').length) {
  $('#pageMenuForm').validate({
    rules: { nama_menu: { required: true, minlength: 2 }, harga: { required: true, number: true, min: 1000 }, kategori_id: { required: true } },
    messages: { nama_menu: { required: 'Name required' }, harga: { required: 'Price required', min: 'Min 1000' }, kategori_id: { required: 'Select a category' } },
    errorClass: 'error', errorElement: 'label',
    highlight: el => $(el).addClass('error'),
    unhighlight: el => $(el).removeClass('error'),
    submitHandler: () => {
      const d = { nama_menu: $('#pageMenuName').val().trim(), harga: +$('#pageMenuPrice').val(), kategori_id: +$('#pageMenuCategory').val() };
      $.ajax({ url: '/api/menu', method: 'POST', contentType: 'application/json', data: JSON.stringify(d) })
        .done(res => {
          if (res.success) {
            ok('Item Added', `"${d.nama_menu}" added to the menu.`).then(() => {
              window.location.href = '/menu.html';
            });
          } else err('Error', res.message);
        }).fail(x => err('Error', x.responseJSON?.message));
    }
  });
}

// ── INIT ─────────────────────────────────────────────────────
function initPageByPath() {
  const path = (window.location.pathname || '').toLowerCase();
  if (path.endsWith('/menu') || path.endsWith('/menu.html')) {
    initMenu();
    const wanted = new URLSearchParams(window.location.search).get('category');
    if (wanted) {
      setTimeout(() => {
        const safeWanted = window.CSS && CSS.escape ? CSS.escape(wanted) : wanted;
        const btn = document.querySelector('.mf-btn[data-catname="' + safeWanted + '"]');
        if (btn) btn.click();
      }, 250);
    }
    return;
  }
  if (path.endsWith('/categories') || path.endsWith('/categories.html')) { initCategories(); return; }
  if (path.endsWith('/insights') || path.endsWith('/insights.html')) { initInsights(); return; }
  if (path.endsWith('/form-menu') || path.endsWith('/form-menu.html')) { initFormPage(); return; }
  if (path.endsWith('/about') || path.endsWith('/about.html')) { return; }
  initDashboard();
}

$(document).ready(() => {
  initPageByPath();
});
