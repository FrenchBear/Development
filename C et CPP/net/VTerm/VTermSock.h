// VTermSock.h : interface of the CVTermSocket class
// 5/5/95 PV

class CVTermDoc;

class CVTermSocket : public CSocket
{
	DECLARE_DYNAMIC(CVTermSocket);
	BOOL  bConnectDone;
	int	  iConnectStatus;

// Construction
public:
	CVTermSocket(CVTermDoc* pDoc);

// Operations
public:
	CVTermDoc* m_pDoc;

// Implementation
protected:
	virtual void OnReceive(int nErrorCode);
	virtual void OnClose(int nErrorCode);
	//virtual void OnConnect(int nErrorCode);
};

