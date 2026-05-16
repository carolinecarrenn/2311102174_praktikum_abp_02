import 'package:flutter/material.dart';
import 'song.dart';

// ── Per-artist gradient palettes ─────────────────────────────────────────────
// Each artist gets a signature gradient used across all their songs/albums.

class _G {
  // Jay Chou 周杰伦 — deep indigo → violet
  static const jay    = [Color(0xFF3B2D6B), Color(0xFF7B5EA7)];
  // Teresa Teng 邓丽君 — dusty rose → mauve
  static const teresa = [Color(0xFF5C2D3A), Color(0xFFA0617A)];
  // Mayday 五月天 — slate blue → teal
  static const mayday = [Color(0xFF1B3A4B), Color(0xFF2E8B7A)];
  // René Liu 刘若英 — warm brown → amber
  static const rene   = [Color(0xFF3D2B1F), Color(0xFF8B6347)];
  // Charlie Zhou 周深 — midnight blue → sky
  static const charlie= [Color(0xFF0D2137), Color(0xFF2980B9)];
  // Faye Wong 王菲 — deep teal → mint
  static const faye   = [Color(0xFF0D3B38), Color(0xFF1ABC9C)];
  // Eason Chan 陈奕迅 — charcoal → warm grey
  static const eason  = [Color(0xFF1C1C2E), Color(0xFF4A4A6A)];
  // G.E.M. 邓紫棋 — deep magenta → rose
  static const gem    = [Color(0xFF4A0E2D), Color(0xFFAA3366)];
  // C-Drama OST — dark gold → amber
  static const cdrama = [Color(0xFF2E1A00), Color(0xFF8B5E00)];
  // 张碧晨 — deep purple → lilac
  static const zhang  = [Color(0xFF2D1B4E), Color(0xFF7B52AB)];
  // Various Artists OST — dark teal → jade
  static const various= [Color(0xFF0A2E2E), Color(0xFF2E7D6E)];
  // Silence Wang 汪苏泷 — deep navy → electric blue
  static const silence= [Color(0xFF0A1628), Color(0xFF1565C0)];
  // Liu Yuning 刘宇宁 — dark forest → sage
  static const liu    = [Color(0xFF102010), Color(0xFF3A7D44)];
  // Zhou Shen 周深 alt — ocean blue → cyan
  static const zhou   = [Color(0xFF003049), Color(0xFF0096C7)];
  // Tia Ray 袁娅维 — charcoal → electric purple
  static const tia    = [Color(0xFF1A0A2E), Color(0xFF7B2FBE)];
  // Zhang Bichen 张碧晨 solo — deep plum → lavender
  static const bichen = [Color(0xFF2B0A3D), Color(0xFF9B59B6)];
  // Sa Dingding 萨顶顶 — earth brown → warm orange
  static const sading = [Color(0xFF2C1503), Color(0xFFD4731A)];
  // Mao Buyi 毛不易 — muted olive → warm beige
  static const mao    = [Color(0xFF1E1E0A), Color(0xFF6B7C3A)];
  // Hu Xia 胡夏 — soft dusk → peach
  static const huxia  = [Color(0xFF2E1A10), Color(0xFFE07B54)];
  // Curley Gao 高曙光 — deep teal → turquoise
  static const curley = [Color(0xFF002B2B), Color(0xFF00897B)];
  // Jane Zhang 张靓颖 — midnight black → hot pink
  static const jane   = [Color(0xFF1A0010), Color(0xFFE91E8C)];
  // Jason Zhang 张杰 — dark slate → sky blue
  static const jason  = [Color(0xFF0D1B2A), Color(0xFF3A86FF)];
  // Yisa Yu 郁可唯 — deep rose → blush
  static const yisa   = [Color(0xFF2E0A1A), Color(0xFFC0607A)];
  // A-Lin 黄丽玲 — dark maroon → coral
  static const alin   = [Color(0xFF2E0B0B), Color(0xFFE05C4B)];
  // Jike Junyi 吉克隽逸 — charcoal → tangerine
  static const jike   = [Color(0xFF1A0A00), Color(0xFFE07B1A)];
  // Tan Weiwei 谭维维 — deep indigo → electric gold
  static const tan    = [Color(0xFF0D0D2B), Color(0xFFB8860B)];
  // Huang Xiaoyun 黄晓云 — dark slate → warm grey
  static const huang  = [Color(0xFF1C1C1C), Color(0xFF6E6E8E)];
  // Diamond Zhang 张碧晨 (Diamond) — deep violet → rose gold
  static const diamond= [Color(0xFF1A0028), Color(0xFFB07090)];
  // Lala Hsu 徐佳莹 — dark moss → mint green
  static const lala   = [Color(0xFF0A1E0A), Color(0xFF4CAF7A)];
  // Angela Zhang 张韶涵 — dusk blue → soft purple
  static const angela = [Color(0xFF0D0D2E), Color(0xFF7C5CB2)];
  // Faye Chan 陈慧琳 — deep burgundy → dusty pink
  static const fayechan= [Color(0xFF2E0A1A), Color(0xFF9B4060)];
}

class MusicData {
  static const List<Song> songs = [
    // ── 周杰伦 Jay Chou ──────────────────────────────────────────────────────
    Song(id:'1',  title:'稻香',           artist:'周杰伦', album:'魔杰座',              duration:'3:42', colorIndex:2, gradientColors:_G.jay,    initial:'周'),
    Song(id:'2',  title:'晴天',           artist:'周杰伦', album:'叶惠美',              duration:'4:29', colorIndex:0, gradientColors:_G.jay,    initial:'周'),
    Song(id:'3',  title:'告白气球',       artist:'周杰伦', album:'周杰伦的床边故事',    duration:'3:33', colorIndex:1, gradientColors:_G.jay,    initial:'周'),
    Song(id:'4',  title:'夜曲',           artist:'周杰伦', album:'十一月的萧邦',        duration:'4:06', colorIndex:4, gradientColors:_G.jay,    initial:'周'),
    Song(id:'5',  title:'七里香',         artist:'周杰伦', album:'七里香',              duration:'4:59', colorIndex:2, gradientColors:_G.jay,    initial:'周'),
    Song(id:'6',  title:'青花瓷',         artist:'周杰伦', album:'我很忙',              duration:'3:59', colorIndex:5, gradientColors:_G.jay,    initial:'周'),
    Song(id:'7',  title:'简单爱',         artist:'周杰伦', album:'范特西',              duration:'4:30', colorIndex:3, gradientColors:_G.jay,    initial:'周'),
    Song(id:'8',  title:'爱在西元前',     artist:'周杰伦', album:'范特西',              duration:'3:55', colorIndex:0, gradientColors:_G.jay,    initial:'周'),
    Song(id:'9',  title:'龙卷风',         artist:'周杰伦', album:'Jay',                 duration:'3:58', colorIndex:1, gradientColors:_G.jay,    initial:'周'),
    Song(id:'10', title:'彩虹',           artist:'周杰伦', album:'我很忙',              duration:'4:00', colorIndex:4, gradientColors:_G.jay,    initial:'周'),
    Song(id:'11', title:'安静',           artist:'周杰伦', album:'范特西',              duration:'5:15', colorIndex:2, gradientColors:_G.jay,    initial:'周'),
    Song(id:'12', title:'暗号',           artist:'周杰伦', album:'八度空间',            duration:'4:14', colorIndex:5, gradientColors:_G.jay,    initial:'周'),

    // ── 邓丽君 Teresa Teng ───────────────────────────────────────────────────
    Song(id:'13', title:'月亮代表我的心', artist:'邓丽君', album:'邓丽君精选',          duration:'3:20', colorIndex:5, gradientColors:_G.teresa, initial:'邓'),
    Song(id:'14', title:'甜蜜蜜',         artist:'邓丽君', album:'邓丽君精选',          duration:'3:48', colorIndex:3, gradientColors:_G.teresa, initial:'邓'),
    Song(id:'15', title:'我只在乎你',     artist:'邓丽君', album:'我只在乎你',          duration:'4:12', colorIndex:0, gradientColors:_G.teresa, initial:'邓'),
    Song(id:'16', title:'千言万语',       artist:'邓丽君', album:'邓丽君精选',          duration:'3:37', colorIndex:2, gradientColors:_G.teresa, initial:'邓'),
    Song(id:'17', title:'夜来香',         artist:'邓丽君', album:'淡淡幽情',            duration:'3:55', colorIndex:1, gradientColors:_G.teresa, initial:'邓'),
    Song(id:'18', title:'何日君再来',     artist:'邓丽君', album:'邓丽君精选',          duration:'3:22', colorIndex:4, gradientColors:_G.teresa, initial:'邓'),

    // ── 五月天 Mayday ────────────────────────────────────────────────────────
    Song(id:'19', title:'突然好想你',     artist:'五月天', album:'后青春期的诗',        duration:'5:14', colorIndex:2, gradientColors:_G.mayday,  initial:'五'),
    Song(id:'20', title:'倔强',           artist:'五月天', album:'时光机',              duration:'4:36', colorIndex:0, gradientColors:_G.mayday,  initial:'五'),
    Song(id:'21', title:'知足',           artist:'五月天', album:'神的孩子都在跳舞',    duration:'4:11', colorIndex:3, gradientColors:_G.mayday,  initial:'五'),
    Song(id:'22', title:'温柔',           artist:'五月天', album:'Second Round',        duration:'4:52', colorIndex:5, gradientColors:_G.mayday,  initial:'五'),
    Song(id:'23', title:'你不是真正的快乐', artist:'五月天', album:'自传',              duration:'4:23', colorIndex:1, gradientColors:_G.mayday,  initial:'五'),
    Song(id:'24', title:'伤心的人别听慢歌', artist:'五月天', album:'后青春期的诗',      duration:'3:48', colorIndex:4, gradientColors:_G.mayday,  initial:'五'),

    // ── 刘若英 René Liu ──────────────────────────────────────────────────────
    Song(id:'25', title:'后来',           artist:'刘若英', album:'我等你',              duration:'4:52', colorIndex:0, gradientColors:_G.rene,    initial:'刘'),
    Song(id:'26', title:'很爱很爱你',     artist:'刘若英', album:'很爱很爱你',          duration:'3:55', colorIndex:2, gradientColors:_G.rene,    initial:'刘'),
    Song(id:'27', title:'原来你也在这里', artist:'刘若英', album:'到处都是我爱你',      duration:'4:08', colorIndex:5, gradientColors:_G.rene,    initial:'刘'),

    // ── 周深 Charlie Zhou ────────────────────────────────────────────────────
    Song(id:'28', title:'大鱼',           artist:'周深',   album:'大鱼海棠 OST',        duration:'4:25', colorIndex:3, gradientColors:_G.charlie, initial:'深'),
    Song(id:'29', title:'起风了',         artist:'周深',   album:'VOICES',              duration:'5:04', colorIndex:1, gradientColors:_G.charlie, initial:'深'),
    Song(id:'30', title:'无羁',           artist:'周深 / 曾轶可', album:'陈情令 OST',   duration:'4:10', colorIndex:4, gradientColors:_G.charlie, initial:'深'),

    // ── 王菲 Faye Wong ───────────────────────────────────────────────────────
    Song(id:'43', title:'传奇',           artist:'王菲',   album:'传奇',                duration:'3:59', colorIndex:5, gradientColors:_G.faye,    initial:'菲'),
    Song(id:'44', title:'红豆',           artist:'王菲',   album:'Di Dar',              duration:'4:22', colorIndex:3, gradientColors:_G.faye,    initial:'菲'),
    Song(id:'45', title:'梦中人',         artist:'王菲',   album:'迷',                  duration:'3:47', colorIndex:1, gradientColors:_G.faye,    initial:'菲'),

    // ── 陈奕迅 Eason Chan ────────────────────────────────────────────────────
    Song(id:'46', title:'十年',           artist:'陈奕迅', album:'L.O.V.E.',             duration:'4:15', colorIndex:0, gradientColors:_G.eason,   initial:'陈'),
    Song(id:'47', title:'好久不见',       artist:'陈奕迅', album:'认了吧',               duration:'4:44', colorIndex:2, gradientColors:_G.eason,   initial:'陈'),
    Song(id:'48', title:'爱情转移',       artist:'陈奕迅', album:"What's Going On...?",  duration:'4:01', colorIndex:4, gradientColors:_G.eason,   initial:'陈'),
    Song(id:'49', title:'富士山下',       artist:'陈奕迅', album:"What's Going On...?",  duration:'4:13', colorIndex:5, gradientColors:_G.eason,   initial:'陈'),

    // ── 邓紫棋 G.E.M. ────────────────────────────────────────────────────────
    Song(id:'50', title:'泡沫',           artist:'邓紫棋', album:'XOXO',                 duration:'4:36', colorIndex:3, gradientColors:_G.gem,     initial:'棋'),
    Song(id:'51', title:'喜欢你',         artist:'邓紫棋', album:'Me Myself',            duration:'3:50', colorIndex:1, gradientColors:_G.gem,     initial:'棋'),
    Song(id:'52', title:'句号',           artist:'邓紫棋', album:'Heartbeat',            duration:'4:08', colorIndex:0, gradientColors:_G.gem,     initial:'棋'),

    // ── C-Drama OST ──────────────────────────────────────────────────────────
    Song(id:'31', title:'执念',           artist:'张碧晨',          album:'香蜜沉沉烬如霜 OST',        duration:'4:18', colorIndex:5, gradientColors:_G.zhang,   initial:'张'),
    Song(id:'32', title:'凉凉',           artist:'张碧晨 / 杨宗纬', album:'三生三世十里桃花 OST',      duration:'4:37', colorIndex:3, gradientColors:_G.zhang,   initial:'张'),
    Song(id:'33', title:'知否知否',       artist:'郁可唯 / 胡夏',   album:'知否知否应是绿肥红瘦 OST',  duration:'3:56', colorIndex:1, gradientColors:_G.various, initial:'知'),
    Song(id:'34', title:'醉赤壁',         artist:'林俊杰',          album:'三国机密 OST',              duration:'4:02', colorIndex:0, gradientColors:_G.cdrama,  initial:'林'),
    Song(id:'35', title:'红颜劫',         artist:'鞠婧祎',          album:'芸汐传 OST',                duration:'3:44', colorIndex:2, gradientColors:_G.cdrama,  initial:'鞠'),
    Song(id:'36', title:'相思赋予谁',     artist:'许嵩',            album:'花千骨 OST',                duration:'4:28', colorIndex:4, gradientColors:_G.cdrama,  initial:'许'),
    Song(id:'37', title:'爱你',           artist:'王菲',            album:'天龙八部 OST',              duration:'3:51', colorIndex:5, gradientColors:_G.faye,    initial:'菲'),
    Song(id:'38', title:'千古',           artist:'张碧晨',          album:'古剑奇谭二 OST',            duration:'4:55', colorIndex:3, gradientColors:_G.zhang,   initial:'张'),
    Song(id:'39', title:'万年',           artist:'邓紫棋',          album:'仙剑奇侠传三 OST',          duration:'4:33', colorIndex:1, gradientColors:_G.gem,     initial:'棋'),
    Song(id:'40', title:'佛系少女',       artist:'冯提莫',          album:'扶摇 OST',                  duration:'3:17', colorIndex:0, gradientColors:_G.cdrama,  initial:'冯'),
    Song(id:'41', title:'天问',           artist:'张韶涵',          album:'梦华录 OST',                duration:'4:41', colorIndex:2, gradientColors:_G.cdrama,  initial:'韶'),
    Song(id:'42', title:'浮夸',           artist:'陈奕迅',          album:'不想放手 OST',              duration:'4:10', colorIndex:4, gradientColors:_G.eason,   initial:'陈'),

    // ── 汪苏泷 Silence Wang ──────────────────────────────────────────────────
    Song(id:'53', title:'有点甜',         artist:'汪苏泷',  album:'有点甜',              duration:'3:28', colorIndex:0, gradientColors:_G.silence, initial:'汪'),
    Song(id:'54', title:'棋子',           artist:'汪苏泷',  album:'棋子',                duration:'4:12', colorIndex:2, gradientColors:_G.silence, initial:'汪'),
    Song(id:'55', title:'微微',           artist:'汪苏泷',  album:'青春烈',              duration:'3:55', colorIndex:4, gradientColors:_G.silence, initial:'汪'),
    Song(id:'56', title:'一路上有你',     artist:'汪苏泷',  album:'一路上有你',          duration:'3:41', colorIndex:1, gradientColors:_G.silence, initial:'汪'),

    // ── 刘宇宁 Liu Yuning ────────────────────────────────────────────────────
    Song(id:'57', title:'翻山越岭',       artist:'刘宇宁',  album:'翻山越岭',            duration:'4:05', colorIndex:3, gradientColors:_G.liu,     initial:'刘'),
    Song(id:'58', title:'要我怎么办',     artist:'刘宇宁',  album:'要我怎么办',          duration:'3:48', colorIndex:5, gradientColors:_G.liu,     initial:'刘'),
    Song(id:'59', title:'路过人间',       artist:'刘宇宁',  album:'路过人间',            duration:'4:22', colorIndex:0, gradientColors:_G.liu,     initial:'刘'),
    Song(id:'60', title:'一生所爱',       artist:'刘宇宁',  album:'一生所爱',            duration:'3:59', colorIndex:2, gradientColors:_G.liu,     initial:'刘'),

    // ── 周深 Zhou Shen ───────────────────────────────────────────────────────
    Song(id:'61', title:'光亮',           artist:'周深',    album:'光亮',                duration:'4:18', colorIndex:1, gradientColors:_G.charlie, initial:'深'),
    Song(id:'62', title:'蓝色降落伞',     artist:'周深',    album:'蓝色降落伞',          duration:'4:35', colorIndex:3, gradientColors:_G.charlie, initial:'深'),
    Song(id:'63', title:'清空',           artist:'周深',    album:'清空',                duration:'4:07', colorIndex:5, gradientColors:_G.charlie, initial:'深'),

    // ── 袁娅维 Tia Ray ───────────────────────────────────────────────────────
    Song(id:'64', title:'陪我看日出',     artist:'袁娅维',  album:'陪我看日出',          duration:'4:44', colorIndex:0, gradientColors:_G.tia,     initial:'袁'),
    Song(id:'65', title:'我爱你',         artist:'袁娅维',  album:'我爱你',              duration:'3:53', colorIndex:2, gradientColors:_G.tia,     initial:'袁'),
    Song(id:'66', title:'时间都去哪儿了', artist:'袁娅维',  album:'时间都去哪儿了',      duration:'4:15', colorIndex:4, gradientColors:_G.tia,     initial:'袁'),

    // ── 张碧晨 Zhang Bichen ──────────────────────────────────────────────────
    Song(id:'67', title:'用心良苦',       artist:'张碧晨',  album:'用心良苦',            duration:'4:31', colorIndex:1, gradientColors:_G.bichen,  initial:'张'),
    Song(id:'68', title:'年轮',           artist:'张碧晨',  album:'年轮',                duration:'4:02', colorIndex:3, gradientColors:_G.bichen,  initial:'张'),
    Song(id:'69', title:'我是你的格桑花', artist:'张碧晨',  album:'格桑花',              duration:'3:46', colorIndex:5, gradientColors:_G.bichen,  initial:'张'),

    // ── 萨顶顶 Sa Dingding ───────────────────────────────────────────────────
    Song(id:'70', title:'万物生',         artist:'萨顶顶',  album:'万物生',              duration:'5:02', colorIndex:0, gradientColors:_G.sading,  initial:'萨'),
    Song(id:'71', title:'左手指月',       artist:'萨顶顶',  album:'左手指月',            duration:'4:38', colorIndex:2, gradientColors:_G.sading,  initial:'萨'),
    Song(id:'72', title:'达哇卓玛',       artist:'萨顶顶',  album:'超自然',              duration:'4:55', colorIndex:4, gradientColors:_G.sading,  initial:'萨'),

    // ── 毛不易 Mao Buyi ──────────────────────────────────────────────────────
    Song(id:'73', title:'消愁',           artist:'毛不易',  album:'平凡的一天',          duration:'4:17', colorIndex:1, gradientColors:_G.mao,     initial:'毛'),
    Song(id:'74', title:'平凡的一天',     artist:'毛不易',  album:'平凡的一天',          duration:'3:59', colorIndex:3, gradientColors:_G.mao,     initial:'毛'),
    Song(id:'75', title:'如果有一天我变得很有钱', artist:'毛不易', album:'平凡的一天', duration:'4:26', colorIndex:5, gradientColors:_G.mao,     initial:'毛'),
    Song(id:'76', title:'入海',           artist:'毛不易',  album:'入海',                duration:'4:08', colorIndex:0, gradientColors:_G.mao,     initial:'毛'),

    // ── 胡夏 Hu Xia ──────────────────────────────────────────────────────────
    Song(id:'77', title:'那些年',         artist:'胡夏',    album:'那些年',              duration:'4:42', colorIndex:2, gradientColors:_G.huxia,   initial:'胡'),
    Song(id:'78', title:'你就不要想起我', artist:'胡夏',    album:'你就不要想起我',      duration:'4:14', colorIndex:4, gradientColors:_G.huxia,   initial:'胡'),
    Song(id:'79', title:'美美哒',         artist:'胡夏',    album:'美美哒',              duration:'3:36', colorIndex:1, gradientColors:_G.huxia,   initial:'胡'),

    // ── 高曙光 Curley Gao ────────────────────────────────────────────────────
    Song(id:'80', title:'你不知道的事',   artist:'高曙光',  album:'你不知道的事',        duration:'4:28', colorIndex:3, gradientColors:_G.curley,  initial:'高'),
    Song(id:'81', title:'想见你',         artist:'高曙光',  album:'想见你',              duration:'3:55', colorIndex:5, gradientColors:_G.curley,  initial:'高'),
    Song(id:'82', title:'太阳',           artist:'高曙光',  album:'太阳',                duration:'4:11', colorIndex:0, gradientColors:_G.curley,  initial:'高'),

    // ── 张靓颖 Jane Zhang ────────────────────────────────────────────────────
    Song(id:'83', title:'我相信',         artist:'张靓颖',  album:'我相信',              duration:'4:01', colorIndex:2, gradientColors:_G.jane,    initial:'靓'),
    Song(id:'84', title:'画心',           artist:'张靓颖',  album:'画心 OST',            duration:'3:48', colorIndex:4, gradientColors:_G.jane,    initial:'靓'),
    Song(id:'85', title:'你不知道的事',   artist:'张靓颖',  album:'你不知道的事',        duration:'4:23', colorIndex:1, gradientColors:_G.jane,    initial:'靓'),
    Song(id:'86', title:'亲爱的那不是爱情', artist:'张靓颖', album:'亲爱的',            duration:'3:57', colorIndex:3, gradientColors:_G.jane,    initial:'靓'),

    // ── 张杰 Jason Zhang ─────────────────────────────────────────────────────
    Song(id:'87', title:'这就是爱',       artist:'张杰',    album:'这就是爱',            duration:'4:09', colorIndex:5, gradientColors:_G.jason,   initial:'杰'),
    Song(id:'88', title:'天下',           artist:'张杰',    album:'天下',                duration:'4:36', colorIndex:0, gradientColors:_G.jason,   initial:'杰'),
    Song(id:'89', title:'我们都一样',     artist:'张杰',    album:'我们都一样',          duration:'4:22', colorIndex:2, gradientColors:_G.jason,   initial:'杰'),
    Song(id:'90', title:'勿忘心安',       artist:'张杰',    album:'勿忘心安',            duration:'4:47', colorIndex:4, gradientColors:_G.jason,   initial:'杰'),

    // ── 郁可唯 Yisa Yu ───────────────────────────────────────────────────────
    Song(id:'91', title:'时间煮雨',       artist:'郁可唯',  album:'时间煮雨',            duration:'4:19', colorIndex:1, gradientColors:_G.yisa,    initial:'郁'),
    Song(id:'92', title:'等你下课',       artist:'郁可唯',  album:'等你下课',            duration:'3:44', colorIndex:3, gradientColors:_G.yisa,    initial:'郁'),
    Song(id:'93', title:'一路上有你',     artist:'郁可唯',  album:'一路上有你',          duration:'4:05', colorIndex:5, gradientColors:_G.yisa,    initial:'郁'),

    // ── 黄丽玲 A-Lin ─────────────────────────────────────────────────────────
    Song(id:'94', title:'给我一个理由忘记', artist:'黄丽玲', album:'幸福了 然后呢',      duration:'4:33', colorIndex:0, gradientColors:_G.alin,    initial:'黄'),
    Song(id:'95', title:'幸福了 然后呢',   artist:'黄丽玲', album:'幸福了 然后呢',       duration:'4:51', colorIndex:2, gradientColors:_G.alin,    initial:'黄'),
    Song(id:'96', title:'分手快乐',       artist:'黄丽玲',  album:'爱回来',              duration:'4:15', colorIndex:4, gradientColors:_G.alin,    initial:'黄'),

    // ── 吉克隽逸 Jike Junyi ──────────────────────────────────────────────────
    Song(id:'97',  title:'你不在',        artist:'吉克隽逸', album:'你不在',             duration:'4:24', colorIndex:1, gradientColors:_G.jike,    initial:'吉'),
    Song(id:'98',  title:'我的滚滚',      artist:'吉克隽逸', album:'我的滚滚',           duration:'3:52', colorIndex:3, gradientColors:_G.jike,    initial:'吉'),
    Song(id:'99',  title:'彼时少年',      artist:'吉克隽逸', album:'彼时少年',           duration:'4:37', colorIndex:5, gradientColors:_G.jike,    initial:'吉'),

    // ── 谭维维 Tan Weiwei ────────────────────────────────────────────────────
    Song(id:'100', title:'乌兰巴托的夜',  artist:'谭维维',  album:'乌兰巴托的夜',        duration:'4:58', colorIndex:0, gradientColors:_G.tan,     initial:'谭'),
    Song(id:'101', title:'鸿雁',          artist:'谭维维',  album:'鸿雁',                duration:'4:13', colorIndex:2, gradientColors:_G.tan,     initial:'谭'),
    Song(id:'102', title:'小娟',          artist:'谭维维',  album:'山歌好比春江水',      duration:'3:48', colorIndex:4, gradientColors:_G.tan,     initial:'谭'),

    // ── 黄晓云 Huang Xiaoyun ─────────────────────────────────────────────────
    Song(id:'103', title:'离别开出花',    artist:'黄晓云',  album:'离别开出花',          duration:'4:06', colorIndex:1, gradientColors:_G.huang,   initial:'晓'),
    Song(id:'104', title:'无名之辈',      artist:'黄晓云',  album:'无名之辈',            duration:'3:55', colorIndex:3, gradientColors:_G.huang,   initial:'晓'),
    Song(id:'105', title:'不将就',        artist:'黄晓云',  album:'不将就',              duration:'4:28', colorIndex:5, gradientColors:_G.huang,   initial:'晓'),

    // ── Diamond Zhang 张碧晨 ─────────────────────────────────────────────────
    Song(id:'106', title:'隐形的翅膀',    artist:'张碧晨',  album:'隐形的翅膀',          duration:'4:17', colorIndex:0, gradientColors:_G.diamond, initial:'张'),
    Song(id:'107', title:'爱的供养',      artist:'张碧晨',  album:'爱的供养',            duration:'4:43', colorIndex:2, gradientColors:_G.diamond, initial:'张'),
    Song(id:'108', title:'梦里花',        artist:'张碧晨',  album:'梦里花',              duration:'3:58', colorIndex:4, gradientColors:_G.diamond, initial:'张'),

    // ── 徐佳莹 Lala Hsu ──────────────────────────────────────────────────────
    Song(id:'109', title:'失落沙洲',      artist:'徐佳莹',  album:'失落沙洲',            duration:'4:32', colorIndex:1, gradientColors:_G.lala,    initial:'徐'),
    Song(id:'110', title:'身骑白马',      artist:'徐佳莹',  album:'寓言',                duration:'4:08', colorIndex:3, gradientColors:_G.lala,    initial:'徐'),
    Song(id:'111', title:'我还是爱着你',  artist:'徐佳莹',  album:'我还是爱着你',        duration:'4:51', colorIndex:5, gradientColors:_G.lala,    initial:'徐'),

    // ── 张韶涵 Angela Zhang ──────────────────────────────────────────────────
    Song(id:'112', title:'欧若拉',        artist:'张韶涵',  album:'歌声',                duration:'3:59', colorIndex:0, gradientColors:_G.angela,  initial:'涵'),
    Song(id:'113', title:'淋雨一直走',    artist:'张韶涵',  album:'淋雨一直走',          duration:'4:27', colorIndex:2, gradientColors:_G.angela,  initial:'涵'),
    Song(id:'114', title:'阿刁',          artist:'张韶涵',  album:'阿刁',                duration:'4:14', colorIndex:4, gradientColors:_G.angela,  initial:'涵'),
    Song(id:'115', title:'有话说不出',    artist:'张韶涵',  album:'有话说不出',          duration:'3:43', colorIndex:1, gradientColors:_G.angela,  initial:'涵'),

    // ── 陈慧琳 Faye Chan ─────────────────────────────────────────────────────
    Song(id:'116', title:'记事本',        artist:'陈慧琳',  album:'记事本',              duration:'4:11', colorIndex:3, gradientColors:_G.fayechan, initial:'琳'),
    Song(id:'117', title:'你的爱',        artist:'陈慧琳',  album:'你的爱',              duration:'4:29', colorIndex:5, gradientColors:_G.fayechan, initial:'琳'),
    Song(id:'118', title:'不如跳舞',      artist:'陈慧琳',  album:'不如跳舞',            duration:'3:47', colorIndex:0, gradientColors:_G.fayechan, initial:'琳'),
    Song(id:'119', title:'爱情来了',      artist:'陈慧琳',  album:'爱情来了',            duration:'4:04', colorIndex:2, gradientColors:_G.fayechan, initial:'琳'),
  ];

  static const List<Album> albums = [
    Album(id:'a01', title:'魔杰座',              artist:'周杰伦',          year:2008, trackCount:10, colorIndex:2, gradientColors:_G.jay,     initial:'周'),
    Album(id:'a02', title:'叶惠美',              artist:'周杰伦',          year:2003, trackCount:10, colorIndex:0, gradientColors:_G.jay,     initial:'周'),
    Album(id:'a03', title:'七里香',              artist:'周杰伦',          year:2004, trackCount:10, colorIndex:3, gradientColors:_G.jay,     initial:'周'),
    Album(id:'a04', title:'范特西',              artist:'周杰伦',          year:2001, trackCount:10, colorIndex:1, gradientColors:_G.jay,     initial:'周'),
    Album(id:'a05', title:'我很忙',              artist:'周杰伦',          year:2007, trackCount:10, colorIndex:4, gradientColors:_G.jay,     initial:'周'),
    Album(id:'a06', title:'邓丽君精选',          artist:'邓丽君',          year:1995, trackCount:18, colorIndex:5, gradientColors:_G.teresa,  initial:'邓'),
    Album(id:'a07', title:'淡淡幽情',            artist:'邓丽君',          year:1983, trackCount:12, colorIndex:3, gradientColors:_G.teresa,  initial:'邓'),
    Album(id:'a08', title:'后青春期的诗',        artist:'五月天',          year:2008, trackCount:12, colorIndex:0, gradientColors:_G.mayday,  initial:'五'),
    Album(id:'a09', title:'自传',                artist:'五月天',          year:2016, trackCount:11, colorIndex:2, gradientColors:_G.mayday,  initial:'五'),
    Album(id:'a10', title:'我等你',              artist:'刘若英',          year:2000, trackCount:10, colorIndex:1, gradientColors:_G.rene,    initial:'刘'),
    Album(id:'a11', title:'VOICES',              artist:'周深',            year:2021, trackCount:8,  colorIndex:4, gradientColors:_G.charlie, initial:'深'),
    Album(id:'a12', title:'三生三世十里桃花 OST', artist:'Various Artists', year:2017, trackCount:15, colorIndex:5, gradientColors:_G.zhang,   initial:'三'),
    Album(id:'a13', title:'陈情令 OST',          artist:'Various Artists', year:2019, trackCount:22, colorIndex:3, gradientColors:_G.various, initial:'陈'),
    Album(id:'a14', title:'知否知否 OST',        artist:'Various Artists', year:2019, trackCount:18, colorIndex:1, gradientColors:_G.various, initial:'知'),
    Album(id:'a15', title:'香蜜沉沉烬如霜 OST',  artist:'Various Artists', year:2018, trackCount:20, colorIndex:0, gradientColors:_G.zhang,   initial:'香'),
    Album(id:'a16', title:'Di Dar',              artist:'王菲',            year:1999, trackCount:10, colorIndex:2, gradientColors:_G.faye,    initial:'菲'),
    Album(id:'a17', title:'L.O.V.E.',            artist:'陈奕迅',          year:2003, trackCount:10, colorIndex:4, gradientColors:_G.eason,   initial:'陈'),
    Album(id:'a18', title:'XOXO',                artist:'邓紫棋',          year:2015, trackCount:12, colorIndex:5, gradientColors:_G.gem,      initial:'棋'),

    // ── New Artists Albums ───────────────────────────────────────────────────
    Album(id:'a19', title:'有点甜',              artist:'汪苏泷',          year:2019, trackCount:10, colorIndex:0, gradientColors:_G.silence,  initial:'汪'),
    Album(id:'a20', title:'青春烈',              artist:'汪苏泷',          year:2021, trackCount:12, colorIndex:2, gradientColors:_G.silence,  initial:'汪'),
    Album(id:'a21', title:'翻山越岭',            artist:'刘宇宁',          year:2020, trackCount:10, colorIndex:3, gradientColors:_G.liu,      initial:'刘'),
    Album(id:'a22', title:'路过人间',            artist:'刘宇宁',          year:2022, trackCount:11, colorIndex:5, gradientColors:_G.liu,      initial:'刘'),
    Album(id:'a23', title:'光亮',                artist:'周深',            year:2022, trackCount:10, colorIndex:1, gradientColors:_G.charlie,  initial:'深'),
    Album(id:'a24', title:'陪我看日出',          artist:'袁娅维',          year:2019, trackCount:10, colorIndex:0, gradientColors:_G.tia,      initial:'袁'),
    Album(id:'a25', title:'时间都去哪儿了',      artist:'袁娅维',          year:2021, trackCount:9,  colorIndex:4, gradientColors:_G.tia,      initial:'袁'),
    Album(id:'a26', title:'用心良苦',            artist:'张碧晨',          year:2015, trackCount:11, colorIndex:1, gradientColors:_G.bichen,   initial:'张'),
    Album(id:'a27', title:'年轮',                artist:'张碧晨',          year:2018, trackCount:12, colorIndex:3, gradientColors:_G.bichen,   initial:'张'),
    Album(id:'a28', title:'万物生',              artist:'萨顶顶',          year:2007, trackCount:11, colorIndex:0, gradientColors:_G.sading,   initial:'萨'),
    Album(id:'a29', title:'超自然',              artist:'萨顶顶',          year:2010, trackCount:10, colorIndex:4, gradientColors:_G.sading,   initial:'萨'),
    Album(id:'a30', title:'平凡的一天',          artist:'毛不易',          year:2018, trackCount:12, colorIndex:1, gradientColors:_G.mao,      initial:'毛'),
    Album(id:'a31', title:'入海',                artist:'毛不易',          year:2021, trackCount:10, colorIndex:3, gradientColors:_G.mao,      initial:'毛'),
    Album(id:'a32', title:'那些年',              artist:'胡夏',            year:2011, trackCount:10, colorIndex:2, gradientColors:_G.huxia,    initial:'胡'),
    Album(id:'a33', title:'你就不要想起我',      artist:'胡夏',            year:2014, trackCount:11, colorIndex:4, gradientColors:_G.huxia,    initial:'胡'),
    Album(id:'a34', title:'你不知道的事',        artist:'高曙光',          year:2020, trackCount:10, colorIndex:3, gradientColors:_G.curley,   initial:'高'),
    Album(id:'a35', title:'我相信',              artist:'张靓颖',          year:2007, trackCount:12, colorIndex:2, gradientColors:_G.jane,     initial:'靓'),
    Album(id:'a36', title:'亲爱的',              artist:'张靓颖',          year:2014, trackCount:11, colorIndex:4, gradientColors:_G.jane,     initial:'靓'),
    Album(id:'a37', title:'这就是爱',            artist:'张杰',            year:2011, trackCount:12, colorIndex:5, gradientColors:_G.jason,    initial:'杰'),
    Album(id:'a38', title:'我们都一样',          artist:'张杰',            year:2016, trackCount:11, colorIndex:0, gradientColors:_G.jason,    initial:'杰'),
    Album(id:'a39', title:'时间煮雨',            artist:'郁可唯',          year:2014, trackCount:10, colorIndex:1, gradientColors:_G.yisa,     initial:'郁'),
    Album(id:'a40', title:'幸福了 然后呢',       artist:'黄丽玲',          year:2013, trackCount:12, colorIndex:0, gradientColors:_G.alin,     initial:'黄'),
    Album(id:'a41', title:'爱回来',              artist:'黄丽玲',          year:2009, trackCount:11, colorIndex:2, gradientColors:_G.alin,     initial:'黄'),
    Album(id:'a42', title:'你不在',              artist:'吉克隽逸',        year:2019, trackCount:10, colorIndex:1, gradientColors:_G.jike,     initial:'吉'),
    Album(id:'a43', title:'乌兰巴托的夜',        artist:'谭维维',          year:2016, trackCount:10, colorIndex:0, gradientColors:_G.tan,      initial:'谭'),
    Album(id:'a44', title:'山歌好比春江水',      artist:'谭维维',          year:2020, trackCount:11, colorIndex:2, gradientColors:_G.tan,      initial:'谭'),
    Album(id:'a45', title:'离别开出花',          artist:'黄晓云',          year:2020, trackCount:10, colorIndex:1, gradientColors:_G.huang,    initial:'晓'),
    Album(id:'a46', title:'隐形的翅膀',          artist:'张碧晨',          year:2006, trackCount:10, colorIndex:0, gradientColors:_G.diamond,  initial:'张'),
    Album(id:'a47', title:'失落沙洲',            artist:'徐佳莹',          year:2009, trackCount:10, colorIndex:1, gradientColors:_G.lala,     initial:'徐'),
    Album(id:'a48', title:'寓言',                artist:'徐佳莹',          year:2011, trackCount:11, colorIndex:3, gradientColors:_G.lala,     initial:'徐'),
    Album(id:'a49', title:'歌声',                artist:'张韶涵',          year:2004, trackCount:10, colorIndex:0, gradientColors:_G.angela,   initial:'涵'),
    Album(id:'a50', title:'淋雨一直走',          artist:'张韶涵',          year:2010, trackCount:12, colorIndex:2, gradientColors:_G.angela,   initial:'涵'),
    Album(id:'a51', title:'阿刁',                artist:'张韶涵',          year:2017, trackCount:10, colorIndex:4, gradientColors:_G.angela,   initial:'涵'),
    Album(id:'a52', title:'记事本',              artist:'陈慧琳',          year:1998, trackCount:12, colorIndex:3, gradientColors:_G.fayechan, initial:'琳'),
    Album(id:'a53', title:'不如跳舞',            artist:'陈慧琳',          year:2001, trackCount:11, colorIndex:5, gradientColors:_G.fayechan, initial:'琳'),
  ];
}
