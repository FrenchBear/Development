/* CLAVIER.H	P.Violent	Plexus version 2  /  MS-C 4.0 + MS-DOS 3.20

   Version 1.00 1.VII.87
   Version 1.10 11.IV.88	CTRL_, ALT_, ...

   D‚finition des codes du clavier, renvoy‚s notemment par getch()
   auxquels on a rajout‚ FKEY si code sp‚cial.
*/

#define FKEY	256
#define SSHIFT	512

#define K_F1	  (59+256)
#define K_F2	  (60+256)
#define K_F3	  (61+256)
#define K_F4	  (62+256)
#define K_F5	  (63+256)
#define K_F6	  (64+256)
#define K_F7	  (65+256)
#define K_F8	  (66+256)
#define K_F9	  (67+256)
#define K_F10	  (68+256)

#define K_SHIFT_F1  (84+256)
#define K_SHIFT_F2  (85+256)
#define K_SHIFT_F3  (86+256)
#define K_SHIFT_F4  (87+256)
#define K_SHIFT_F5  (88+256)
#define K_SHIFT_F6  (89+256)
#define K_SHIFT_F7  (90+256)
#define K_SHIFT_F8  (91+256)
#define K_SHIFT_F9  (92+256)
#define K_SHIFT_F10 (93+256)

#define K_CTRL_F1   (94+256)
#define K_CTRL_F2   (95+256)
#define K_CTRL_F3   (96+256)
#define K_CTRL_F4   (97+256)
#define K_CTRL_F5   (98+256)
#define K_CTRL_F6   (99+256)
#define K_CTRL_F7  (100+256)
#define K_CTRL_F8  (101+256)
#define K_CTRL_F9  (102+256)
#define K_CTRL_F10 (103+256)

#define K_ALT_F1  (104+256)
#define K_ALT_F2  (105+256)
#define K_ALT_F3  (106+256)
#define K_ALT_F4  (107+256)
#define K_ALT_F5  (108+256)
#define K_ALT_F6  (109+256)
#define K_ALT_F7  (110+256)
#define K_ALT_F8  (111+256)
#define K_ALT_F9  (112+256)
#define K_ALT_F10 (113+256)

#define K_HOME	  (71+256)
#define K_END	  (79+256)
#define K_PGUP	  (73+256)
#define K_PGDN	  (81+256)
#define K_UP	  (72+256)
#define K_DOWN	  (80+256)
#define K_LEFT	  (75+256)
#define K_RIGHT   (77+256)
#define K_INS	  (82+256)
#define K_DEL	  (83+256)

#define K_CTRL_HOME  (119+256)
#define K_CTRL_END   (117+256)
#define K_CTRL_PGUP  (132+256)
#define K_CTRL_PGDN  (118+256)
#define K_CTRL_LEFT  (115+256)
#define K_CTRL_RIGHT (116+256)

#define K_SHIFT_TAB  (15+256)

#define K_ALT_1      (120+256)
#define K_ALT_2      (121+256)
#define K_ALT_3      (122+256)
#define K_ALT_4      (123+256)
#define K_ALT_5      (124+256)
#define K_ALT_6      (125+256)
#define K_ALT_7      (126+256)
#define K_ALT_8      (127+256)
#define K_ALT_9      (128+256)
#define K_ALT_0      (129+256)
#define K_ALT_MOINS  (130+256)
#define K_ALT_EGALE  (131+256)

#define K_ALT_Q   (16+256)
#define K_ALT_W   (17+256)
#define K_ALT_E   (18+256)
#define K_ALT_R   (19+256)
#define K_ALT_T   (20+256)
#define K_ALT_Y   (21+256)
#define K_ALT_U   (22+256)
#define K_ALT_I   (23+256)
#define K_ALT_O   (24+256)
#define K_ALT_P   (25+256)

#define K_ALT_A   (30+256)
#define K_ALT_S   (31+256)
#define K_ALT_D   (32+256)
#define K_ALT_F   (33+256)
#define K_ALT_G   (34+256)
#define K_ALT_H   (35+256)
#define K_ALT_J   (36+256)
#define K_ALT_K   (37+256)
#define K_ALT_L   (38+256)

#define K_ALT_Z   (44+256)
#define K_ALT_X   (45+256)
#define K_ALT_C   (46+256)
#define K_ALT_V   (47+256)
#define K_ALT_B   (48+256)
#define K_ALT_N   (49+256)
#define K_ALT_M   (50+256)

/* Les codes qui suivent sont lus directement, et pas en touches de fctn */

#define K_CTRL_BACK   127
#define K_CTRL_RET     10
#define K_TAB		9
#define K_RET	       13
#define K_BACK		8
#define K_ESC	       27
#define K_ESPACE       32

#define K_CTRL_A  1
#define K_CTRL_B  2
#define K_CTRL_C  3
#define K_CTRL_D  4
#define K_CTRL_E  5
#define K_CTRL_F  6
#define K_CTRL_G  7
#define K_CTRL_H  8
#define K_CTRL_I  9
#define K_CTRL_J  10
#define K_CTRL_K  11
#define K_CTRL_L  12
#define K_CTRL_M  13
#define K_CTRL_N  14
#define K_CTRL_O  15
#define K_CTRL_P  16
#define K_CTRL_Q  17
#define K_CTRL_R  18
#define K_CTRL_S  19
#define K_CTRL_T  20
#define K_CTRL_U  21
#define K_CTRL_V  22
#define K_CTRL_W  23
#define K_CTRL_X  24
#define K_CTRL_Y  25
#define K_CTRL_Z  26
