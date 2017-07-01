[
  odl,
  uuid(0000011A-0000-0000-C000-000000000046)
]
interface IParseDisplayName : stdole.IUnknown {

    HRESULT ParseDisplayName(
        [in] IBindCtx *pIBindCtx,
        [in] LONG pszDisplayName,
        [in, out] long *pchEaten,
        [out, retval] IMoniker **ppIMoniker);

};


[
  odl,
  uuid(0000011B-0000-0000-C000-000000000046)
]
interface IOleContainer : stdole.IUnknown {

    HRESULT ParseDisplayName(
        [in] IBindCtx *pIBindCtx,
        [in] LONG pszDisplayName,
        [in, out] long* pchEaten,
        [out, retval] IMoniker **ppIMoniker);

    HRESULT EnumObjects(
        [in] OLECONTF grfFlags,
        [in, out] IEnumUnknown **ppenum);

    HRESULT LockContainer(
        [in] BOOL fLock);

};
