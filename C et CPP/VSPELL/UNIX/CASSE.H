// casse.h
// Tableau de conversion de casse
// Implantation des fontions isalpha, tolower, toupper... 
// avec les caract�res accentu�s PC-8
// PV mai 94

#define a_CIRCONFLEXE   131
#define e_AIGU          130
#define e_GRAVE         138
#define e_CIRCONFLEXE   136
#define i_CIRCONFLEXE   140
#define o_CIRCONFLEXE   147
#define E_AIGU          144
#define c_CEDILLE       135


#define FCC_CARACTERE   1
#define FCC_MINUSCULE   2
#define FCC_MAJUSCULE   4

static struct sConvCasse
{
  uchar cMajAcc;        // Majuscule accentu�e
  uchar cMajNA;         // Majuscule non accentu�e
  uchar cMin;           // Minuscule
  uchar uFlag;
} tCasse[256] =
{
  /*   0 0x00   */      '\000', '\000', '\000', 0,
  /*   1 0x01   */      '\001', '\001', '\001', 0,
  /*   2 0x02   */      '\002', '\002', '\002', 0,
  /*   3 0x03   */      '\003', '\003', '\003', 0,
  /*   4 0x04   */      '\004', '\004', '\004', 0,
  /*   5 0x05   */      '\005', '\005', '\005', 0,
  /*   6 0x06   */      '\006', '\006', '\006', 0,
  /*   7 0x07   */      '\007', '\007', '\007', 0,
  /*   8 0x08   */      '\010', '\010', '\010', 0,
  /*   9 0x09   */      '\011', '\011', '\011', 0,
  /*  10 0x0A   */      '\012', '\012', '\012', 0,
  /*  11 0x0B   */      '\013', '\013', '\013', 0,
  /*  12 0x0C   */      '\014', '\014', '\014', 0,
  /*  13 0x0D   */      '\015', '\015', '\015', 0,
  /*  14 0x0E   */      '\016', '\016', '\016', 0,
  /*  15 0x0F   */      '\017', '\017', '\017', 0,
  /*  16 0x10   */      '\020', '\020', '\020', 0,
  /*  17 0x11   */      '\021', '\021', '\021', 0,
  /*  18 0x12   */      '\022', '\022', '\022', 0,
  /*  19 0x13   */      '\023', '\023', '\023', 0,
  /*  20 0x14   */      '\024', '\024', '\024', 0,
  /*  21 0x15   */      '\025', '\025', '\025', 0,
  /*  22 0x16   */      '\026', '\026', '\026', 0,
  /*  23 0x17   */      '\027', '\027', '\027', 0,
  /*  24 0x18   */      '\030', '\030', '\030', 0,
  /*  25 0x19   */      '\031', '\031', '\031', 0,
  /*  26 0x1A   */      '\032', '\032', '\032', 0,
  /*  27 0x1B   */      '\033', '\033', '\033', 0,
  /*  28 0x1C   */      '\034', '\034', '\034', 0,
  /*  29 0x1D   */      '\035', '\035', '\035', 0,
  /*  30 0x1E   */      '\036', '\036', '\036', 0,
  /*  31 0x1F   */      '\037', '\037', '\037', 0,
  /*  32 0x20   */      ' ',    ' ',    ' ',    0,
  /*  33 0x21 ! */      '!',    '!',    '!',    0,
  /*  34 0x22 " */      '"',    '"',    '"',    0,
  /*  35 0x23 # */      '#',    '#',    '#',    0,
  /*  36 0x24 $ */      '$',    '$',    '$',    0,
  /*  37 0x25 % */      '%',    '%',    '%',    0,
  /*  38 0x26 & */      '&',    '&',    '&',    0,
  /*  39 0x27 ' */      '\'',   '\'',   '\'',   0,
  /*  40 0x28 ( */      '(',    '(',    '(',    0,
  /*  41 0x29 ) */      ')',    ')',    ')',    0,
  /*  42 0x2A * */      '*',    '*',    '*',    0,
  /*  43 0x2B + */      '+',    '+',    '+',    0,
  /*  44 0x2C , */      ',',    ',',    ',',    0,
  /*  45 0x2D - */      '-',    '-',    '-',    0,
  /*  46 0x2E . */      '.',    '.',    '.',    0,
  /*  47 0x2F / */      '/',    '/',    '/',    0,
  /*  48 0x30 0 */      '0',    '0',    '0',    0,
  /*  49 0x31 1 */      '1',    '1',    '1',    0,
  /*  50 0x32 2 */      '2',    '2',    '2',    0,
  /*  51 0x33 3 */      '3',    '3',    '3',    0,
  /*  52 0x34 4 */      '4',    '4',    '4',    0,
  /*  53 0x35 5 */      '5',    '5',    '5',    0,
  /*  54 0x36 6 */      '6',    '6',    '6',    0,
  /*  55 0x37 7 */      '7',    '7',    '7',    0,
  /*  56 0x38 8 */      '8',    '8',    '8',    0,
  /*  57 0x39 9 */      '9',    '9',    '9',    0,
  /*  58 0x3A : */      ':',    ':',    ':',    0,
  /*  59 0x3B ; */      ';',    ';',    ';',    0,
  /*  60 0x3C < */      '<',    '<',    '<',    0,
  /*  61 0x3D = */      '=',    '=',    '=',    0,
  /*  62 0x3E > */      '>',    '>',    '>',    0,
  /*  63 0x3F ? */      '?',    '?',    '?',    0,
  /*  64 0x40 @ */      '@',    '@',    '@',    0,
  /*  65 0x41 A */      'A',    'A',    'a',    FCC_CARACTERE|FCC_MAJUSCULE,
  /*  66 0x42 B */      'B',    'B',    'b',    FCC_CARACTERE|FCC_MAJUSCULE,
  /*  67 0x43 C */      'C',    'C',    'c',    FCC_CARACTERE|FCC_MAJUSCULE,
  /*  68 0x44 D */      'D',    'D',    'd',    FCC_CARACTERE|FCC_MAJUSCULE,
  /*  69 0x45 E */      'E',    'E',    'e',    FCC_CARACTERE|FCC_MAJUSCULE,
  /*  70 0x46 F */      'F',    'F',    'f',    FCC_CARACTERE|FCC_MAJUSCULE,
  /*  71 0x47 G */      'G',    'G',    'g',    FCC_CARACTERE|FCC_MAJUSCULE,
  /*  72 0x48 H */      'H',    'H',    'h',    FCC_CARACTERE|FCC_MAJUSCULE,
  /*  73 0x49 I */      'I',    'I',    'i',    FCC_CARACTERE|FCC_MAJUSCULE,
  /*  74 0x4A J */      'J',    'J',    'j',    FCC_CARACTERE|FCC_MAJUSCULE,
  /*  75 0x4B K */      'K',    'K',    'k',    FCC_CARACTERE|FCC_MAJUSCULE,
  /*  76 0x4C L */      'L',    'L',    'l',    FCC_CARACTERE|FCC_MAJUSCULE,
  /*  77 0x4D M */      'M',    'M',    'm',    FCC_CARACTERE|FCC_MAJUSCULE,
  /*  78 0x4E N */      'N',    'N',    'n',    FCC_CARACTERE|FCC_MAJUSCULE,
  /*  79 0x4F O */      'O',    'O',    'o',    FCC_CARACTERE|FCC_MAJUSCULE,
  /*  80 0x50 P */      'P',    'P',    'p',    FCC_CARACTERE|FCC_MAJUSCULE,
  /*  81 0x51 Q */      'Q',    'Q',    'q',    FCC_CARACTERE|FCC_MAJUSCULE,
  /*  82 0x52 R */      'R',    'R',    'r',    FCC_CARACTERE|FCC_MAJUSCULE,
  /*  83 0x53 S */      'S',    'S',    's',    FCC_CARACTERE|FCC_MAJUSCULE,
  /*  84 0x54 T */      'T',    'T',    't',    FCC_CARACTERE|FCC_MAJUSCULE,
  /*  85 0x55 U */      'U',    'U',    'u',    FCC_CARACTERE|FCC_MAJUSCULE,
  /*  86 0x56 V */      'V',    'V',    'v',    FCC_CARACTERE|FCC_MAJUSCULE,
  /*  87 0x57 W */      'W',    'W',    'w',    FCC_CARACTERE|FCC_MAJUSCULE,
  /*  88 0x58 X */      'X',    'X',    'x',    FCC_CARACTERE|FCC_MAJUSCULE,
  /*  89 0x59 Y */      'Y',    'Y',    'y',    FCC_CARACTERE|FCC_MAJUSCULE,
  /*  90 0x5A Z */      'Z',    'Z',    'z',    FCC_CARACTERE|FCC_MAJUSCULE,
  /*  91 0x5B [ */      '[',    '[',    '[',    0,
  /*  92 0x5C \ */      '\\',   '\\',   '\\',   0,
  /*  93 0x5D ] */      ']',    ']',    ']',    0,
  /*  94 0x5E ^ */      '^',    '^',    '^',    0,
  /*  95 0x5F _ */      '_',    '_',    '_',    0,
  /*  96 0x60 ` */      '`',    '`',    '`',    0,
  /*  97 0x61 a */      'A',    'A',    'a',    FCC_CARACTERE|FCC_MINUSCULE,
  /*  98 0x62 b */      'B',    'B',    'b',    FCC_CARACTERE|FCC_MINUSCULE,
  /*  99 0x63 c */      'C',    'C',    'c',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 100 0x64 d */      'D',    'D',    'd',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 101 0x65 e */      'E',    'E',    'e',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 102 0x66 f */      'F',    'F',    'f',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 103 0x67 g */      'G',    'G',    'g',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 104 0x68 h */      'H',    'H',    'h',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 105 0x69 i */      'I',    'I',    'i',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 106 0x6A j */      'J',    'J',    'j',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 107 0x6B k */      'K',    'K',    'k',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 108 0x6C l */      'L',    'L',    'l',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 109 0x6D m */      'M',    'M',    'm',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 110 0x6E n */      'N',    'N',    'n',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 111 0x6F o */      'O',    'O',    'o',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 112 0x70 p */      'P',    'P',    'p',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 113 0x71 q */      'Q',    'Q',    'q',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 114 0x72 r */      'R',    'R',    'r',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 115 0x73 s */      'S',    'S',    's',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 116 0x74 t */      'T',    'T',    't',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 117 0x75 u */      'U',    'U',    'u',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 118 0x76 v */      'V',    'V',    'v',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 119 0x77 w */      'W',    'W',    'w',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 120 0x78 x */      'X',    'X',    'x',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 121 0x79 y */      'Y',    'Y',    'y',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 122 0x7A z */      'Z',    'Z',    'z',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 123 0x7B { */      '{',    '{',    '{',    0,
  /* 124 0x7C | */      '|',    '|',    '|',    0,
  /* 125 0x7D } */      '}',    '}',    '}',    0,
  /* 126 0x7E ~ */      '~',    '~',    '~',    0,
  /* 127 0x7F  */      '',    '',    '',    0,
  /* 128 0x80 � */      '�',    'C',    '�',    FCC_CARACTERE|FCC_MAJUSCULE,
  /* 129 0x81 � */      '�',    'U',    '�',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 130 0x82 � */      '�',    'E',    '�',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 131 0x83 � */      'A',    'A',    '�',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 132 0x84 � */      'A',    'A',    '�',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 133 0x85 � */      'A',    'A',    '�',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 134 0x86 � */      'A',    'A',    '�',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 135 0x87 � */      '�',    'C',    '�',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 136 0x88 � */      'E',    'E',    '�',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 137 0x89 � */      'E',    'E',    '�',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 138 0x8A � */      'E',    'E',    '�',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 139 0x8B � */      'I',    'I',    '�',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 140 0x8C � */      'I',    'I',    '�',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 141 0x8D � */      'I',    'I',    '�',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 142 0x8E � */      '�',    'A',    '�',    FCC_CARACTERE|FCC_MAJUSCULE,
  /* 143 0x8F � */      '�',    'A',    '�',    FCC_CARACTERE|FCC_MAJUSCULE,
  /* 144 0x90 � */      '�',    'E',    '�',    FCC_CARACTERE|FCC_MAJUSCULE,
  /* 145 0x91 � */      '�',    '�',    '�',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 146 0x92 � */      '�',    '�',    '�',    FCC_CARACTERE|FCC_MAJUSCULE,
  /* 147 0x93 � */      'O',    'O',    '�',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 148 0x94 � */      '�',    'O',    '�',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 149 0x95 � */      'O',    'O',    '�',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 150 0x96 � */      'U',    'U',    '�',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 151 0x97 � */      'U',    'U',    '�',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 152 0x98 � */      'Y',    'Y',    '�',    FCC_CARACTERE|FCC_MINUSCULE,
  /* 153 0x99 � */      '�',    'O',    '�',    FCC_CARACTERE|FCC_MAJUSCULE,
  /* 154 0x9A � */      '�',    'U',    '�',    FCC_CARACTERE|FCC_MAJUSCULE,
  /* 155 0x9B � */      '�',    '�',    '�',    0,
  /* 156 0x9C � */      '�',    '�',    '�',    0,
  /* 157 0x9D � */      '�',    '�',    '�',    0,
  /* 158 0x9E � */      '�',    '�',    '�',    0,
  /* 159 0x9F � */      '�',    '�',    '�',    0,
  /* 160 0xA0 � */      '�',    '�',    '�',    0,
  /* 161 0xA1 � */      '�',    '�',    '�',    0,
  /* 162 0xA2 � */      '�',    '�',    '�',    0,
  /* 163 0xA3 � */      '�',    '�',    '�',    0,
  /* 164 0xA4 � */      '�',    '�',    '�',    0,
  /* 165 0xA5 � */      '�',    '�',    '�',    0,
  /* 166 0xA6 � */      '�',    '�',    '�',    0,
  /* 167 0xA7 � */      '�',    '�',    '�',    0,
  /* 168 0xA8 � */      '�',    '�',    '�',    0,
  /* 169 0xA9 � */      '�',    '�',    '�',    0,
  /* 170 0xAA � */      '�',    '�',    '�',    0,
  /* 171 0xAB � */      '�',    '�',    '�',    0,
  /* 172 0xAC � */      '�',    '�',    '�',    0,
  /* 173 0xAD � */      '�',    '�',    '�',    0,
  /* 174 0xAE � */      '�',    '�',    '�',    0,
  /* 175 0xAF � */      '�',    '�',    '�',    0,
  /* 176 0xB0 � */      '�',    '�',    '�',    0,
  /* 177 0xB1 � */      '�',    '�',    '�',    0,
  /* 178 0xB2 � */      '�',    '�',    '�',    0,
  /* 179 0xB3 � */      '�',    '�',    '�',    0,
  /* 180 0xB4 � */      '�',    '�',    '�',    0,
  /* 181 0xB5 � */      '�',    '�',    '�',    0,
  /* 182 0xB6 � */      '�',    '�',    '�',    0,
  /* 183 0xB7 � */      '�',    '�',    '�',    0,
  /* 184 0xB8 � */      '�',    '�',    '�',    0,
  /* 185 0xB9 � */      '�',    '�',    '�',    0,
  /* 186 0xBA � */      '�',    '�',    '�',    0,
  /* 187 0xBB � */      '�',    '�',    '�',    0,
  /* 188 0xBC � */      '�',    '�',    '�',    0,
  /* 189 0xBD � */      '�',    '�',    '�',    0,
  /* 190 0xBE � */      '�',    '�',    '�',    0,
  /* 191 0xBF � */      '�',    '�',    '�',    0,
  /* 192 0xC0 � */      '�',    '�',    '�',    0,
  /* 193 0xC1 � */      '�',    '�',    '�',    0,
  /* 194 0xC2 � */      '�',    '�',    '�',    0,
  /* 195 0xC3 � */      '�',    '�',    '�',    0,
  /* 196 0xC4 � */      '�',    '�',    '�',    0,
  /* 197 0xC5 � */      '�',    '�',    '�',    0,
  /* 198 0xC6 � */      '�',    '�',    '�',    0,
  /* 199 0xC7 � */      '�',    '�',    '�',    0,
  /* 200 0xC8 � */      '�',    '�',    '�',    0,
  /* 201 0xC9 � */      '�',    '�',    '�',    0,
  /* 202 0xCA � */      '�',    '�',    '�',    0,
  /* 203 0xCB � */      '�',    '�',    '�',    0,
  /* 204 0xCC � */      '�',    '�',    '�',    0,
  /* 205 0xCD � */      '�',    '�',    '�',    0,
  /* 206 0xCE � */      '�',    '�',    '�',    0,
  /* 207 0xCF � */      '�',    '�',    '�',    0,
  /* 208 0xD0 � */      '�',    '�',    '�',    0,
  /* 209 0xD1 � */      '�',    '�',    '�',    0,
  /* 210 0xD2 � */      '�',    '�',    '�',    0,
  /* 211 0xD3 � */      '�',    '�',    '�',    0,
  /* 212 0xD4 � */      '�',    '�',    '�',    0,
  /* 213 0xD5 � */      '�',    '�',    '�',    0,
  /* 214 0xD6 � */      '�',    '�',    '�',    0,
  /* 215 0xD7 � */      '�',    '�',    '�',    0,
  /* 216 0xD8 � */      '�',    '�',    '�',    0,
  /* 217 0xD9 � */      '�',    '�',    '�',    0,
  /* 218 0xDA � */      '�',    '�',    '�',    0,
  /* 219 0xDB � */      '�',    '�',    '�',    0,
  /* 220 0xDC � */      '�',    '�',    '�',    0,
  /* 221 0xDD � */      '�',    '�',    '�',    0,
  /* 222 0xDE � */      '�',    '�',    '�',    0,
  /* 223 0xDF � */      '�',    '�',    '�',    0,
  /* 224 0xE0 � */      '�',    '�',    '�',    0,
  /* 225 0xE1 � */      '�',    '�',    '�',    0,
  /* 226 0xE2 � */      '�',    '�',    '�',    0,
  /* 227 0xE3 � */      '�',    '�',    '�',    0,
  /* 228 0xE4 � */      '�',    '�',    '�',    0,
  /* 229 0xE5 � */      '�',    '�',    '�',    0,
  /* 230 0xE6 � */      '�',    '�',    '�',    0,
  /* 231 0xE7 � */      '�',    '�',    '�',    0,
  /* 232 0xE8 � */      '�',    '�',    '�',    0,
  /* 233 0xE9 � */      '�',    '�',    '�',    0,
  /* 234 0xEA � */      '�',    '�',    '�',    0,
  /* 235 0xEB � */      '�',    '�',    '�',    0,
  /* 236 0xEC � */      '�',    '�',    '�',    0,
  /* 237 0xED � */      '�',    '�',    '�',    0,
  /* 238 0xEE � */      '�',    '�',    '�',    0,
  /* 239 0xEF � */      '�',    '�',    '�',    0,
  /* 240 0xF0 � */      '�',    '�',    '�',    0,
  /* 241 0xF1 � */      '�',    '�',    '�',    0,
  /* 242 0xF2 � */      '�',    '�',    '�',    0,
  /* 243 0xF3 � */      '�',    '�',    '�',    0,
  /* 244 0xF4 � */      '�',    '�',    '�',    0,
  /* 245 0xF5 � */      '�',    '�',    '�',    0,
  /* 246 0xF6 � */      '�',    '�',    '�',    0,
  /* 247 0xF7 � */      '�',    '�',    '�',    0,
  /* 248 0xF8 � */      '�',    '�',    '�',    0,
  /* 249 0xF9 � */      '�',    '�',    '�',    0,
  /* 250 0xFA � */      '�',    '�',    '�',    0,
  /* 251 0xFB � */      '�',    '�',    '�',    0,
  /* 252 0xFC � */      '�',    '�',    '�',    0,
  /* 253 0xFD � */      '�',    '�',    '�',    0,
  /* 254 0xFE � */      '�',    '�',    '�',    0,
  /* 255 0xFF   */      '�',    '�',    '�',    0,
};


int iEstMaj(uchar c)
{
  return tCasse[c].uFlag & FCC_MAJUSCULE;
}

uchar cMaj(uchar c)
{
  return tCasse[c].cMajAcc;
}

uchar cMajAZ(uchar c)
{
  return tCasse[c].cMajNA;
}

uchar cMin(uchar c)
{
  return tCasse[c].cMin;
}

