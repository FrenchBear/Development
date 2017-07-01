typedef enum {
    tomRTF = 1,
    tomText = 2,
    tomHTML = 3,
    tomWordDocument = 4,
    tomCreateNew = 16,
    tomCreateAlways = 32,
    tomOpenExisting = 48,
    tomOpenAlways = 64,
    tomTruncateExisting = 80,
    tomReadOnly = 256,
    tomShareDenyRead = 512,
    tomShareDenyWrite = 1024,
    tomPasteFile = 4096,
} tomOpenFlags;

typedef enum {
    tomLineSpaceSingle = 0,
    tomLineSpace1pt5 = 1,
    tomLineSpaceDouble = 2,
    tomLineSpaceAtLeast = 3,
    tomLineSpaceExactly = 4,
    tomLineSpaceMultiple = 5,
} tomLineSpacingRules;

typedef enum {
    tomAlignLeft = 0,
    tomAlignCenter = 1,
    tomAlignRight = 2,
    tomAlignJustify = 3,
    tomAlignDecimal = 3,
    tomAlignBar = 4,
} tomAlign;

typedef enum {
    tomNoSelection = 0,
    tomSelectionIP = 1,
    tomSelectionNormal = 2,
    tomSelectionFrame = 3,
    tomSelectionColumn = 4,
    tomSelectionRow = 5,
    tomSelectionBlock = 6,
    tomSelectionInlineShape = 7,
    tomSelectionShape = 8,
} tomSelection;

typedef enum {
    tomFalse = 0,
    tomTrue = 0xffffffff,
    tomToggle = 0xff676982,
} tomBool;

typedef enum {
    tomAutoColor = 0xff676983,
} tomColor;

typedef enum {
    tomDefault = 0xff676984,
    tomUndefined = 0xff676981,
} tomResetFlags;

typedef enum {
    tomBackward = 0xc0000001,
    tomForward = 0x3fffffff,
} tomMove;

typedef enum {
    tomMove = 0,
    tomExtend = 1,
} tomExtend;

typedef enum {
    tomSelStartActive = 1,
    tomSelAtEOL = 2,
    tomSelOvertype = 4,
    tomSelActive = 8,
    tomSelReplace = 16,
} tomSelectionFlags;

typedef enum {
    tomEnd = 0,
    tomStart = 32,
} tomStartEnd;

typedef enum {
    tomCollapseEnd = 0,
    tomCollapseStart = 1,
} tomCollapse;

typedef enum {
    tomNone = 0,
    tomSingle = 1,
    tomWords = 2,
    tomDouble = 3,
    tomDotted = 4,
} tomUnderline;

typedef enum {
    tomSpaces = 0,
    tomDots = 1,
    tomDashes = 2,
    tomLines = 3,
} tomTabSpace;

typedef enum {
    tomTabBack = 0xfffffffd,
    tomTabNext = 0xfffffffe,
    tomTabHere = 0xffffffff,
} tomTabs;

typedef enum {
    tomListNone = 0,
    tomListBullet = 1,
    tomListNumberAsArabic = 2,
    tomListNumberAsLCLetter = 3,
    tomListNumberAsUCLetter = 4,
    tomListNumberAsLCRoman = 5,
    tomListNumberAsUCRoman = 6,
    tomListNumberAsSequence = 7,
    tomListParentheses = 0x00010000,
    tomListPeriod = 0x00020000,
    tomListPlain = 0x00030000,
} tomList;

typedef enum {
    tomCharacter = 1,
    tomWord = 2,
    tomSentence = 3,
    tomParagraph = 4,
    tomLine = 5,
    tomStory = 6,
    tomScreen = 7,
    tomSection = 8,
    tomColumn = 9,
    tomRow = 10,
    tomWindow = 11,
    tomCell = 12,
    tomCharFormat = 13,
    tomParaFormat = 14,
    tomTable = 15,
    tomObject = 16,
} tomUnits;

typedef enum {
    tomMatchWord = 2,
    tomMatchCase = 4,
    tomMatchPattern = 8,
} tomFindFlags;

typedef enum {
    tomUnknownStory = 0,
    tomMainTextStory = 1,
    tomFootnotesStory = 2,
    tomEndnotesStory = 3,
    tomCommentsStory = 4,
    tomTextFrameStory = 5,
    tomEvenPagesHeaderStory = 6,
    tomPrimaryHeaderStory = 7,
    tomEvenPagesFooterStory = 8,
    tomPrimaryFooterStory = 9,
    tomFirstPageHeaderStory = 10,
    tomFirstPageFooterStory = 11,
} tomStories;

typedef enum {
    tomNoAnimation = 0,
    tomLasVegasLights = 1,
    tomBlinkingBackground = 2,
    tomSparkleText = 3,
    tomMarchingBlackAnts = 4,
    tomMarchingRedAnts = 5,
    tomShimmer = 6,
    tomWipeDown = 7,
    tomWipeRight = 8,
    tomAnimationMax = 8,
} tomAnimation;

typedef enum {
    tomLowerCase = 0,
    tomUpperCase = 1,
    tomTitleCase = 2,
    tomSentenceCase = 4,
    tomToggleCase = 5,
} tomCase;

[
    odl,
    uuid(8CC497C0-A1DF-11CE-8098-00AA0047BE5D),
    version(1.0),
    dual,
    nonextensible,
    oleautomation
]
interface ITextDocument : IDispatch {

    [id(00000000), propget]
    HRESULT Name(
         [out, retval] BSTR* pName);

    [id(0x00000001), propget]
    HRESULT Selection(
         [out, retval] ITextSelection** ppSel);

    [id(0x00000002), propget]
    HRESULT StoryCount(
         [out, retval] long* pCount);

    [id(0x00000003), propget]
    HRESULT StoryRanges(
         [out, retval] ITextStoryRanges** ppStories);

    [id(0x00000004), propget]
    HRESULT Saved(
         [out, retval] long* pValue);

    [id(0x00000004), propput]
    HRESULT Saved(
         [in] long pValue);

    [id(0x00000005), propget]
    HRESULT DefaultTabStop(
         [out, retval] float *pValue);

    [id(0x00000005), propput]
    HRESULT DefaultTabStop(
         [in] float pValue);

    [id(0x00000006)]
    HRESULT New();

    [id(0x00000007)]
    HRESULT Open(
         [in] VARIANT* pVar, 
         [in] tomOpenFlags Flags, 
         [in, defaultvalue(0)] long CodePage);

    [id(0x00000008)]
    HRESULT Save(
         [in] VARIANT* pVar, 
         [in] tomOpenFlags Flags, 
         [in, defaultvalue(0)] long CodePage);

    [id(0x00000009)]
    HRESULT Freeze(
        [out, retval] long* pCount);

    [id(0x0000000a)]
    HRESULT Unfreeze(
        [out, retval] long* pCount);

    [id(0x0000000b)]
    HRESULT BeginEditCollection();

    [id(0x0000000c)]
    HRESULT EndEditCollection();

    [id(0x0000000d)]
    HRESULT Undo(
        [in] long Count, 
        [out, retval] long* prop);

    [id(0x0000000e)]
    HRESULT Redo(
        [in] long Count, 
        [out, retval] long* prop);

    [id(0x0000000f)]
    HRESULT Range(
        [in, defaultvalue(0)] long cp1, 
        [in, defaultvalue(-1)] long cp2, 
        [out, retval] ITextRange** ppRange);

    [id(0x00000010)]
    HRESULT RangeFromPoint(
        [in] long x, 
        [in] long y, 
        [out, retval] ITextRange** ppRange);

};

[
  odl,
  uuid(8CC497C2-A1DF-11CE-8098-00AA0047BE5D),
  version(1.0),
  dual,
  nonextensible,
  oleautomation
]
interface ITextRange : IDispatch {
    [id(00000000), propget]
    HRESULT Text([out, retval] BSTR* pbstr);

    [id(00000000), propput]
    HRESULT Text([in] BSTR pbstr);

    [id(0x00000201), propget]
    HRESULT Char([out, retval] long* pch);

    [id(0x00000201), propput]
    HRESULT Char([in] long pch);

    [id(0x00000202), propget]
    HRESULT Duplicate([out, retval] ITextRange** ppRange);

    [id(0x00000203), propget]
    HRESULT FormattedText([out, retval] ITextRange** ppRange);

    [id(0x00000203), propput]
    HRESULT FormattedText([in] ITextRange* ppRange);

    [id(0x00000204), propget]
    HRESULT Start([out, retval] long* pcpFirst);

    [id(0x00000204), propput]
    HRESULT Start([in] long pcpFirst);

    [id(0x00000205), propget]
    HRESULT End([out, retval] long* pcpLim);

    [id(0x00000205), propput]
    HRESULT End([in] long pcpLim);

    [id(0x00000206), propget]
    HRESULT Font([out, retval] ITextFont** pFont);

    [id(0x00000206), propput]
    HRESULT Font([in] ITextFont* pFont);

    [id(0x00000207), propget]
    HRESULT Para([out, retval] ITextPara** pPara);

    [id(0x00000207), propput]
    HRESULT Para([in] ITextPara* pPara);

    [id(0x00000208), propget]
    HRESULT StoryLength([out, retval] long* pcch);

    [id(0x00000209), propget]
    HRESULT StoryType([out, retval] long* pValue);

    [id(0x00000210)]
    HRESULT Collapse([in] long bStart);

    [id(0x00000211)]
    HRESULT Expand(
                    [in] long Unit, 
                    [out, retval] long* pDelta);

    [id(0x00000212)]
    HRESULT GetIndex(
                    [in] long Unit, 
                    [out, retval] long* pIndex);

    [id(0x00000213)]
    HRESULT SetIndex(
                    [in] long Unit, 
                    [in] long Index, 
                    [in] long Extend);

    [id(0x00000214)]
    HRESULT SetRange(
                    [in] long cpActive, 
                    [in] long cpOther);

    [id(0x00000215)]
    HRESULT InRange(
                    [in] ITextRange* pRange, 
                    [out, retval] long* pb);

    [id(0x00000216)]
    HRESULT InStory(
                    [in] ITextRange* pRange, 
                    [out, retval] long* pb);

    [id(0x00000217)]
    HRESULT IsEqual(
                    [in] ITextRange* pRange, 
                    [out, retval] long* pb);

    [id(0x00000218)]
    HRESULT Select();

    [id(0x00000219)]
    HRESULT StartOf(
                    [in] long Unit, 
                    [in] long Extend, 
                    [out, retval] long* pDelta);

    [id(0x00000220)]
    HRESULT EndOf(
                    [in] long Unit, 
                    [in] long Extend, 
                    [out, retval] long* pDelta);

    [id(0x00000221)]
    HRESULT Move(
                    [in] long Unit, 
                    [in] long Count, 
                    [out, retval] long* pDelta);

    [id(0x00000222)]
    HRESULT MoveStart(
                    [in] long Unit, 
                    [in] long Count, 
                    [out, retval] long* pDelta);

    [id(0x00000223)]
    HRESULT MoveEnd(
                    [in] long Unit, 
                    [in] long Count, 
                    [out, retval] long* pDelta);

    [id(0x00000224)]
    HRESULT MoveWhile(
                    [in] VARIANT* Cset, 
                    [in] long Count, 
                    [out, retval] long* pDelta);

    [id(0x00000225)]
    HRESULT MoveStartWhile(
                    [in] VARIANT* Cset, 
                    [in] long Count, 
                    [out, retval] long* pDelta);

    [id(0x00000226)]
    HRESULT MoveEndWhile(
                    [in] VARIANT* Cset, 
                    [in] long Count, 
                    [out, retval] long* pDelta);

    [id(0x00000227)]
    HRESULT MoveUntil(
                    [in] VARIANT* Cset, 
                    [in] long Count, 
                    [out, retval] long* pDelta);

    [id(0x00000228)]
    HRESULT MoveStartUntil(
                    [in] VARIANT* Cset, 
                    [in] long Count, 
                    [out, retval] long* pDelta);

    [id(0x00000229)]
    HRESULT MoveEndUntil(
                    [in] VARIANT* Cset, 
                    [in] long Count, 
                    [out, retval] long* pDelta);

    [id(0x00000230)]
    HRESULT FindText(
                    [in] BSTR bstr, 
                    [in] long cch, 
                    [in] long Flags, 
                    [out, retval] long* pLength);

    [id(0x00000231)]
    HRESULT FindTextStart(
                    [in] BSTR bstr, 
                    [in] long cch, 
                    [in] long Flags, 
                    [out, retval] long* pLength);

    [id(0x00000232)]
    HRESULT FindTextEnd(
                    [in] BSTR bstr, 
                    [in] long cch, 
                    [in] long Flags, 
                    [out, retval] long* pLength);

    [id(0x00000233)]
    HRESULT Delete(
                    [in] long Unit, 
                    [in] long Count, 
                    [out, retval] long* pDelta);

    [id(0x00000234)]
    HRESULT Cut([out] VARIANT* pVar);

    [id(0x00000235)]
    HRESULT Copy([out] VARIANT* pVar);

    [id(0x00000236)]
    HRESULT Paste(
                    [in] VARIANT* pVar, 
                    [in] long Format);

    [id(0x00000237)]
    HRESULT CanPaste(
                    [in] VARIANT* pVar, 
                    [in] long Format, 
                    [out, retval] long* pb);

    [id(0x00000238)]
    HRESULT CanEdit([out, retval] long* pbCanEdit);

    [id(0x00000239)]
    HRESULT ChangeCase([in] long Type);

    [id(0x00000240)]
    HRESULT GetPoint(
                    [in] long Type, 
                    [out] long* px, 
                    [out] long* py);

    [id(0x00000241)]
    HRESULT SetPoint(
                    [in] long x, 
                    [in] long y, 
                    [in] long Type, 
                    [in] long Extend);

    [id(0x00000242)]
    HRESULT ScrollIntoView([in] long Value);

    [id(0x00000243)]
    HRESULT GetEmbeddedObject([out, retval] IUnknown** ppv);

};

[
  odl,
  uuid(8CC497C1-A1DF-11CE-8098-00AA0047BE5D),
  version(1.0),
  dual,
  nonextensible,
  oleautomation
]
interface ITextSelection : ITextRange {
    [id(0x00000101), propget]
    HRESULT Flags([out, retval] long* pFlags);

    [id(0x00000101), propput]
    HRESULT Flags([in] long pFlags);

    [id(0x00000102), propget]
    HRESULT Type([out, retval] long* pType);

    [id(0x00000103)]
    HRESULT MoveLeft(
                    [in] long Unit, 
                    [in] long Count, 
                    [in] long Extend, 
                    [out, retval] long* pDelta);

    [id(0x00000104)]
    HRESULT MoveRight(
                    [in] long Unit, 
                    [in] long Count, 
                    [in] long Extend, 
                    [out, retval] long* pDelta);

    [id(0x00000105)]
    HRESULT MoveUp(
                    [in] long Unit, 
                    [in] long Count, 
                    [in] long Extend, 
                    [out, retval] long* pDelta);

    [id(0x00000106)]
    HRESULT MoveDown(
                    [in] long Unit, 
                    [in] long Count, 
                    [in] long Extend, 
                    [out, retval] long* pDelta);

    [id(0x00000107)]
    HRESULT HomeKey(
                    [in] long Unit, 
                    [in] long Extend, 
                    [out, retval] long* pDelta);

    [id(0x00000108)]
    HRESULT EndKey(
                    [in] long Unit, 
                    [in] long Extend, 
                    [out, retval] long* pDelta);

    [id(0x00000109)]
    HRESULT TypeText([in] BSTR bstr);

};

[
  odl,
  uuid(8CC497C3-A1DF-11CE-8098-00AA0047BE5D),
  version(1.0),
  dual,
  nonextensible,
  oleautomation
]
interface ITextFont : IDispatch {
    [id(00000000), propget]
    HRESULT Duplicate([out, retval] ITextFont** ppFont);

    [id(00000000), propput]
    HRESULT Duplicate([in] ITextFont* ppFont);

    [id(0x00000301)]
    HRESULT CanChange([out, retval] long* pb);

    [id(0x00000302)]
    HRESULT IsEqual(
                    [in] ITextFont* pFont, 
                    [out, retval] long* pb);

    [id(0x00000303)]
    HRESULT Reset([in] long Value);

    [id(0x00000304), propget]
    HRESULT Style([out, retval] long* pValue);

    [id(0x00000304), propput]
    HRESULT Style([in] long pValue);

    [id(0x00000305), propget]
    HRESULT AllCaps([out, retval] long* pValue);

    [id(0x00000305), propput]
    HRESULT AllCaps([in] long pValue);

    [id(0x00000306), propget]
    HRESULT Animation([out, retval] long* pValue);

    [id(0x00000306), propput]
    HRESULT Animation([in] long pValue);

    [id(0x00000307), propget]
    HRESULT BackColor([out, retval] long* pValue);

    [id(0x00000307), propput]
    HRESULT BackColor([in] long pValue);

    [id(0x00000308), propget]
    HRESULT Bold([out, retval] long* pValue);

    [id(0x00000308), propput]
    HRESULT Bold([in] long pValue);

    [id(0x00000309), propget]
    HRESULT Emboss([out, retval] long* pValue);

    [id(0x00000309), propput]
    HRESULT Emboss([in] long pValue);

    [id(0x00000310), propget]
    HRESULT ForeColor([out, retval] long* pValue);

    [id(0x00000310), propput]
    HRESULT ForeColor([in] long pValue);

    [id(0x00000311), propget]
    HRESULT Hidden([out, retval] long* pValue);

    [id(0x00000311), propput]
    HRESULT Hidden([in] long pValue);

    [id(0x00000312), propget]
    HRESULT Engrave([out, retval] long* pValue);

    [id(0x00000312), propput]
    HRESULT Engrave([in] long pValue);

    [id(0x00000313), propget]
    HRESULT Italic([out, retval] long* pValue);

    [id(0x00000313), propput]
    HRESULT Italic([in] long pValue);

    [id(0x00000314), propget]
    HRESULT Kerning([out, retval] float* pValue);

    [id(0x00000314), propput]
    HRESULT Kerning([in] float pValue);

    [id(0x00000315), propget]
    HRESULT LanguageID([out, retval] long* pValue);

    [id(0x00000315), propput]
    HRESULT LanguageID([in] long pValue);

    [id(0x00000316), propget]
    HRESULT Name([out, retval] BSTR* pbstr);

    [id(0x00000316), propput]
    HRESULT Name([in] BSTR pbstr);

    [id(0x00000317), propget]
    HRESULT Outline([out, retval] long* pValue);

    [id(0x00000317), propput]
    HRESULT Outline([in] long pValue);

    [id(0x00000318), propget]
    HRESULT Position([out, retval] float* pValue);

    [id(0x00000318), propput]
    HRESULT Position([in] float pValue);

    [id(0x00000319), propget]
    HRESULT Protected([out, retval] long* pValue);

    [id(0x00000319), propput]
    HRESULT Protected([in] long pValue);

    [id(0x00000320), propget]
    HRESULT Shadow([out, retval] long* pValue);

    [id(0x00000320), propput]
    HRESULT Shadow([in] long pValue);

    [id(0x00000321), propget]
    HRESULT Size([out, retval] float* pValue);

    [id(0x00000321), propput]
    HRESULT Size([in] float pValue);

    [id(0x00000322), propget]
    HRESULT SmallCaps([out, retval] long* pValue);

    [id(0x00000322), propput]
    HRESULT SmallCaps([in] long pValue);

    [id(0x00000323), propget]
    HRESULT Spacing([out, retval] float* pValue);

    [id(0x00000323), propput]
    HRESULT Spacing([in] float pValue);

    [id(0x00000324), propget]
    HRESULT StrikeThrough([out, retval] long* pValue);

    [id(0x00000324), propput]
    HRESULT StrikeThrough([in] long pValue);

    [id(0x00000325), propget]
    HRESULT Subscript([out, retval] long* pValue);

    [id(0x00000325), propput]
    HRESULT Subscript([in] long pValue);

    [id(0x00000326), propget]
    HRESULT Superscript([out, retval] long* pValue);

    [id(0x00000326), propput]
    HRESULT Superscript([in] long pValue);

    [id(0x00000327), propget]
    HRESULT Underline([out, retval] long* pValue);

    [id(0x00000327), propput]
    HRESULT Underline([in] long pValue);

    [id(0x00000328), propget]
    HRESULT Weight([out, retval] long* pValue);

    [id(0x00000328), propput]
    HRESULT Weight([in] long pValue);

};

[
  odl,
  uuid(8CC497C4-A1DF-11CE-8098-00AA0047BE5D),
  version(1.0),
  dual,
  nonextensible,
  oleautomation
]
interface ITextPara : IDispatch {
    [id(00000000), propget]
    HRESULT Duplicate([out, retval] ITextPara** ppPara);

    [id(00000000), propput]
    HRESULT Duplicate([in] ITextPara* ppPara);

    [id(0x00000401)]
    HRESULT CanChange([out, retval] long* pb);

    [id(0x00000402)]
    HRESULT IsEqual(
                    [in] ITextPara* pPara, 
                    [out, retval] long* pb);

    [id(0x00000403)]
    HRESULT Reset([in] long Value);

    [id(0x00000404), propget]
    HRESULT Style([out, retval] long* pValue);

    [id(0x00000404), propput]
    HRESULT Style([in] long pValue);

    [id(0x00000405), propget]
    HRESULT Alignment([out, retval] long* pValue);

    [id(0x00000405), propput]
    HRESULT Alignment([in] long pValue);

    [id(0x00000406), propget]
    HRESULT Hyphenation([out, retval] long* pValue);

    [id(0x00000406), propput]
    HRESULT Hyphenation([in] long pValue);

    [id(0x00000407), propget]
    HRESULT FirstLineIndent([out, retval] float* pValue);

    [id(0x00000408), propget]
    HRESULT KeepTogether([out, retval] long* pValue);

    [id(0x00000408), propput]
    HRESULT KeepTogether([in] long pValue);

    [id(0x00000409), propget]
    HRESULT KeepWithNext([out, retval] long* pValue);

    [id(0x00000409), propput]
    HRESULT KeepWithNext([in] long pValue);

    [id(0x00000410), propget]
    HRESULT LeftIndent([out, retval] float* pValue);

    [id(0x00000411), propget]
    HRESULT LineSpacing([out, retval] float* pValue);

    [id(0x00000412), propget]
    HRESULT LineSpacingRule([out, retval] long* pValue);

    [id(0x00000413), propget]
    HRESULT ListAlignment([out, retval] long* pValue);

    [id(0x00000413), propput]
    HRESULT ListAlignment([in] long pValue);

    [id(0x00000414), propget]
    HRESULT ListLevelIndex([out, retval] long* pValue);

    [id(0x00000414), propput]
    HRESULT ListLevelIndex([in] long pValue);

    [id(0x00000415), propget]
    HRESULT ListStart([out, retval] long* pValue);

    [id(0x00000415), propput]
    HRESULT ListStart([in] long pValue);

    [id(0x00000416), propget]
    HRESULT ListTab([out, retval] float* pValue);

    [id(0x00000416), propput]
    HRESULT ListTab([in] float pValue);

    [id(0x00000417), propget]
    HRESULT ListType([out, retval] long* pValue);

    [id(0x00000417), propput]
    HRESULT ListType([in] long pValue);

    [id(0x00000418), propget]
    HRESULT NoLineNumber([out, retval] long* pValue);

    [id(0x00000418), propput]
    HRESULT NoLineNumber([in] long pValue);

    [id(0x00000419), propget]
    HRESULT PageBreakBefore([out, retval] long* pValue);

    [id(0x00000419), propput]
    HRESULT PageBreakBefore([in] long pValue);

    [id(0x00000420), propget]
    HRESULT RightIndent([out, retval] float* pValue);

    [id(0x00000420), propput]
    HRESULT RightIndent([in] float pValue);

    [id(0x00000421)]
    HRESULT SetIndents(
                    [in] float StartIndent, 
                    [in] float LeftIndent, 
                    [in] float RightIndent);

    [id(0x00000422)]
    HRESULT SetLineSpacing(
                    [in] long LineSpacingRule, 
                    [in] float LineSpacing);

    [id(0x00000423), propget]
    HRESULT SpaceAfter([out, retval] float* pValue);

    [id(0x00000423), propput]
    HRESULT SpaceAfter([in] float pValue);

    [id(0x00000424), propget]
    HRESULT SpaceBefore([out, retval] float* pValue);

    [id(0x00000424), propput]
    HRESULT SpaceBefore([in] float pValue);

    [id(0x00000425), propget]
    HRESULT WidowControl([out, retval] long* pValue);

    [id(0x00000425), propput]
    HRESULT WidowControl([in] long pValue);

    [id(0x00000426), propget]
    HRESULT TabCount([out, retval] long* pCount);

    [id(0x00000427)]
    HRESULT AddTab(
                    [in] float tbPos, 
                    [in] long tbAlign, 
                    [in] long tbLeader);

    [id(0x00000428)]
    HRESULT ClearAllTabs();

    [id(0x00000429)]
    HRESULT DeleteTab([in] float tbPos);

    [id(0x00000430)]
    HRESULT GetTab(
                    [in] long iTab, 
                    [out] float* ptbPos, 
                    [out] long* ptbAlign, 
                    [out] long* ptbLeader);

};

[
  odl,
  uuid(8CC497C5-A1DF-11CE-8098-00AA0047BE5D),
  version(1.0),
  dual,
  nonextensible,
  oleautomation
]
interface ITextStoryRanges : IDispatch {

    [id(0xfffffffc), restricted]
    HRESULT _NewEnum(
		[out, retval] VARIANT *ppunkEnum);


    [id(00000000)]
	HRESULT Item(
		[in] long Index, 
		[out, retval] ITextRange** ppRange);


    [id(0x00000002), propget]
    HRESULT Count(
		[out, retval] long* pCount);


};
