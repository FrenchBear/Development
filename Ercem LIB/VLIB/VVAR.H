/* VVAR.H	 P.Violent     MSC 4.0|5.0 / MS-DOS
**
** Liste des variables publiques de Vlib
*/

extern const uint1   _vlibmajor,_vlibminor;
extern const uint1   far * const vb_dptr,vb_at;
extern const uint1   vb_io,vb_lig,vb_col,vb_curs;
extern const uint2   vb_index,vt_col2;
extern const uint1   vt_lig,vt_col,vt_vmode,vt_police,vt_type;
extern const booleen vt_couleur;
extern const int2    am_lig,am_col;
extern const int2    pa_nbitem,pa_stack_free;
extern const uint2   pa_buffer_free;
extern const int2    vc_nbhotkey,vc_nbmaxhotkey;
extern	     booleen vc_okhotkey;
extern	     booleen md_oknuage,md_oktravail;
