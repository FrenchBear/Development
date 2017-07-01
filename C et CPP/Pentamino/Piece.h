// Piece.h: interface for the Piece class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_PIECE_H__2480A264_9CFB_11D2_8D8E_0060086AA0DA__INCLUDED_)
#define AFX_PIECE_H__2480A264_9CFB_11D2_8D8E_0060086AA0DA__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class Piece  
{
public:
  short	hNumPiece;		// N° dans le jeu Katamino
  char	cPiece;			// Lettre
  Carre55 c[8];			// 8 transformations maxi
  int	iNbt;			// Nb de transformations

  
  Piece::Piece(short hNP, char cP,
		int i00, int i01, int i02, int i03, int i04,
	    int i10, int i11, int i12, int i13, int i14,
		int i20, int i21, int i22, int i23, int i24);
  void Dessin();
};

#endif // !defined(AFX_PIECE_H__2480A264_9CFB_11D2_8D8E_0060086AA0DA__INCLUDED_)
