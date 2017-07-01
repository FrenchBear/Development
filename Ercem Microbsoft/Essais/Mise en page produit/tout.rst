<xml xmlns:s='uuid:BDC6E3F0-6DA3-11d1-A2A3-00AA00C14882'
	xmlns:dt='uuid:C2F41010-65B3-11d1-A29F-00AA00C14882'
	xmlns:rs='urn:schemas-microsoft-com:rowset'
	xmlns:z='#RowsetSchema'>
<s:Schema id='RowsetSchema'>
	<s:ElementType name='row' content='eltOnly' rs:updatable='true'>
		<s:attribute type='pro_numpro'/>
		<s:attribute type='pro_nom'/>
		<s:attribute type='pro_critere'/>
		<s:attribute type='pro_t1'/>
		<s:attribute type='pro_t2'/>
		<s:attribute type='pro_t3'/>
		<s:attribute type='pro_t4'/>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
	<s:AttributeType name='pro_numpro' rs:number='1' rs:write='true'>
		<s:datatype dt:type='int' dt:maxLength='4' rs:precision='0' rs:fixedlength='true' rs:maybenull='false'/>
	</s:AttributeType>
	<s:AttributeType name='pro_nom' rs:number='2' rs:write='true'>
		<s:datatype dt:type='string' dt:maxLength='60' rs:precision='0' rs:maybenull='false'/>
	</s:AttributeType>
	<s:AttributeType name='pro_critere' rs:number='3' rs:write='true'>
		<s:datatype dt:type='string' rs:maybenull='false'/>
	</s:AttributeType>
	<s:AttributeType name='pro_t1' rs:number='4' rs:write='true'>
		<s:datatype dt:type='i2' dt:maxLength='2' rs:precision='0' rs:fixedlength='true' rs:maybenull='false'/>
	</s:AttributeType>
	<s:AttributeType name='pro_t2' rs:number='5' rs:write='true'>
		<s:datatype dt:type='i2' dt:maxLength='2' rs:precision='0' rs:fixedlength='true' rs:maybenull='false'/>
	</s:AttributeType>
	<s:AttributeType name='pro_t3' rs:number='6' rs:write='true'>
		<s:datatype dt:type='i2' dt:maxLength='2' rs:precision='0' rs:fixedlength='true' rs:maybenull='false'/>
	</s:AttributeType>
	<s:AttributeType name='pro_t4' rs:number='7' rs:write='true'>
		<s:datatype dt:type='i2' dt:maxLength='2' rs:precision='0' rs:fixedlength='true' rs:maybenull='false'/>
	</s:AttributeType>
</s:Schema>
<rs:data>
	<rs:insert>
		<z:row pro_numpro='5000' pro_nom='NAPPAGE' pro_critere='A1' pro_t1='0' pro_t2='12' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='6174' pro_nom='SANDWICH AU FROMAGE (LAIT CRU)' pro_critere='A7' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='6'/>
		<z:row pro_numpro='6173' pro_nom='QUEUE DE PORC CUITE' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='22' pro_t4='1'/>
		<z:row pro_numpro='6172' pro_nom='CÉLERI ENTIER ÉPLUCHÉ' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='5'/>
		<z:row pro_numpro='6171' pro_nom='ROGNONS DE BOEUF CUISINÉS ET FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='9'
			 pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='6170' pro_nom='CANAPÉ AUX PRODUITS CUITS' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='7'/>
		<z:row pro_numpro='6169' pro_nom='PATE D&#x27;ANCHOIS' pro_critere='M6' pro_t1='0' pro_t2='3' pro_t3='11' pro_t4='1'/>
		<z:row pro_numpro='6168' pro_nom='VIANDE DE BOEUF CRUE MARINÉE' pro_critere='F10' pro_t1='0' pro_t2='1' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='6166' pro_nom='STEAK DE BISON CRU MARINÉ' pro_critere='F10' pro_t1='0' pro_t2='1' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='6165' pro_nom='DARNE DE REQUIN SURGELÉE' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='6162' pro_nom='PLAT DE COTE DE PORC CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='3'/>
		<z:row pro_numpro='6161' pro_nom='HACHÉ DE POISSON CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='6160' pro_nom='SAUMONETTE FUMÉE' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='6159' pro_nom='ABVT1 BARRACUDA' pro_critere='V1' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='6158' pro_nom='BLANC DE DINDE TRAITÉ EN SALAISON CUIT (F)' pro_critere='A1' pro_t1='0' pro_t2='5'
			 pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='6157' pro_nom='FRITURE DE POISSON CRU SURGELÉE' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='12'
			 pro_t4='1'/>
		<z:row pro_numpro='6156' pro_nom='SALSIFIS CUIT ASSAISONNÉS' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='6155' pro_nom='SCAMPI CRUS DÉCORTIQUÉS' pro_critere='I8' pro_t1='0' pro_t2='3' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='6154' pro_nom='PAIN BURGER' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='6153' pro_nom='NOISETTES CARAMELISÉES' pro_critere='A1' pro_t1='0' pro_t2='12' pro_t3='2'
			 pro_t4='3'/>
		<z:row pro_numpro='6152' pro_nom='RATE DE PORC CRUE (F)' pro_critere='B15' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='6151' pro_nom='GATEAU DE VIANDE CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='6150' pro_nom='CHIMICHANGAS CUIT' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='6'/>
		<z:row pro_numpro='6149' pro_nom='APONÉVROSE DE BOEUF' pro_critere='B1' pro_t1='0' pro_t2='1' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='6148' pro_nom='PATES ET FRUITS DE MER NON ASSAISONNÉS' pro_critere='X22' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='9'/>
		<z:row pro_numpro='6146' pro_nom='RUMSTECK DE BOEUF CRU P' pro_critere='E1' pro_t1='0' pro_t2='1' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='6145' pro_nom='BRUSCHETTA' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='7'/>
		<z:row pro_numpro='6144' pro_nom='PANNA COTTA' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='6143' pro_nom='TZATZIKI' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='6142' pro_nom='LANGOUSTINES CRUES DÉCORTIQUÉES CONGELÉES (D)' pro_critere='I1' pro_t1='0'
			 pro_t2='3' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='6141' pro_nom='STEAK HACHÉ DE TAUREAU CRU' pro_critere='B1' pro_t1='0' pro_t2='1' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='6139' pro_nom='PALERON DE CHEVAL CRU P' pro_critere='E1' pro_t1='0' pro_t2='1' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='6138' pro_nom='QUEUES DE GAMBAS PRÉCUITES (D) DÉCONDITIONNEES' pro_critere='I6' pro_t1='0'
			 pro_t2='3' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='6137' pro_nom='FARCE DE PATÉ CROUTE CUITE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='13'
			 pro_t4='1'/>
		<z:row pro_numpro='6136' pro_nom='PASTRAMI' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='6135' pro_nom='NOIX DE PORC CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='6134' pro_nom='CAKE AU JAMBON ET FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='9'/>
		<z:row pro_numpro='6133' pro_nom='PUDDING CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='6132' pro_nom='PATE CRUE' pro_critere='A6' pro_t1='0' pro_t2='8' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='6131' pro_nom='OEUFS DE SAUMON SEMI-CONSERVE' pro_critere='M1' pro_t1='0' pro_t2='3' pro_t3='11'
			 pro_t4='1'/>
		<z:row pro_numpro='6130' pro_nom='ESCALOPE DE DINDONNEAU CRUE TRAITÉE EN SALAISON' pro_critere='F11' pro_t1='0'
			 pro_t2='5' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='6129' pro_nom='BUCHETTE CUITE AU FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='6128' pro_nom='POISSON PANÉ PRÉCUIT AU FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='9'
			 pro_t3='5' pro_t4='6'/>
		<z:row pro_numpro='6127' pro_nom='ABVT1 MÉROU' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='6126' pro_nom='FRIAND AUX LÉGUMES CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='9'/>
		<z:row pro_numpro='6124' pro_nom='MERGUEZ DE VOLAILLE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='3'/>
		<z:row pro_numpro='6123' pro_nom='BACON PRÉCUIT' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='6122' pro_nom='ÉMINCÉ DE BOEUF PRÉCUIT' pro_critere='B2' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='4'/>
		<z:row pro_numpro='6121' pro_nom='GATEAU SEC' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='6120' pro_nom='CRUMBLE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='6119' pro_nom='PATE DE CACAO' pro_critere='A1' pro_t1='0' pro_t2='12' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='6118' pro_nom='TRUITE CRUE SURGELÉE' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='6117' pro_nom='MOUSSE MASCARPONE' pro_critere='P3' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='6116' pro_nom='OEUF COQUILLE' pro_critere='R1' pro_t1='0' pro_t2='7' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='6115' pro_nom='NOIX DE VEAU CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='6114' pro_nom='TOMATE FARCIE AVEC FROMAGE CUISINÉE' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='6113' pro_nom='TARTE A LA SEMOULE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='6112' pro_nom='RAVIOLES CUITS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='4'/>
		<z:row pro_numpro='6111' pro_nom='FILET DE TRUITE CRU MARINÉ' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='6106' pro_nom='MOUSSE DE LÉGUMES CRUS' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='18'/>
		<z:row pro_numpro='6105' pro_nom='CREVETTES CRUES CONGELÉES' pro_critere='I6' pro_t1='0' pro_t2='3' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='6104' pro_nom='FILET DE POISSON CRU MARINÉ' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='6102' pro_nom='OLIVES NOIRES' pro_critere='A5' pro_t1='0' pro_t2='12' pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='6101' pro_nom='AVOCAT AU POISSON MAYONNAISE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='13'/>
		<z:row pro_numpro='6100' pro_nom='CIBOULETTE SURGELÉE' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2' pro_t4='4'/>
		<z:row pro_numpro='6099' pro_nom='ABVT1 PERCHE' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='6098' pro_nom='ABVT1 GARDON' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='6097' pro_nom='GRAS DE BOEUF CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='6096' pro_nom='TARTELETTE AUX MARRONS' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='6095' pro_nom='ABVT1 FILET DE SAINT PIERRE' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='6093' pro_nom='FILET DE SAINT PIERRE FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='6092' pro_nom='RILLETTES DE CANARD (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='9'
			 pro_t4='1'/>
		<z:row pro_numpro='6091' pro_nom='TOURNEDOS DE POISSON FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='6090' pro_nom='PROFITEROLES CHANTILLY (S)' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='6089' pro_nom='MAROILLES AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='6088' pro_nom='ASPIC DE VOLAILLE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='6087' pro_nom='BROUSSE' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='11' pro_t4='1'/>
		<z:row pro_numpro='6086' pro_nom='COULOMMIERS AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='6085' pro_nom='SAUTÉ DE PORC SAUMURÉ CRU' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='6083' pro_nom='BLANC DE VOLAILLE CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='6082' pro_nom='POT AU FEU DE LA MER CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='6081' pro_nom='CREVETTES CUITES FROIDES' pro_critere='I2' pro_t1='0' pro_t2='8' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='6080' pro_nom='BOUDIN DE SAUMON' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='19' pro_t4='1'/>
		<z:row pro_numpro='6078' pro_nom='PELARDON AU LAIT PASTEURISÉ' pro_critere='O7' pro_t1='0' pro_t2='6' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='6077' pro_nom='POMMES DE TERRE ET FILET DE HARENG FUMÉ NON ASSAISONNÉS' pro_critere='X22'
			 pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='13'/>
		<z:row pro_numpro='6076' pro_nom='ABVT5 CREVETTES' pro_critere='V5' pro_t1='0' pro_t2='3' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='6075' pro_nom='POINTE DE PORC CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='6074' pro_nom='RAGOUT D&#x27;AGNEAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='6073' pro_nom='RAVIOLIS CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='4'/>
		<z:row pro_numpro='6072' pro_nom='ENDIVE CUITE NON ASSAISONNÉE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='6071' pro_nom='OEUF DUR ET CREVETTE MAYONNAISE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='15'/>
		<z:row pro_numpro='6070' pro_nom='HAMBURGER DE BOEUF CRU' pro_critere='B1' pro_t1='0' pro_t2='1' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='6069' pro_nom='FRAISE DE VEAU CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='6068' pro_nom='FARCE PRÉCUITE' pro_critere='F4' pro_t1='0' pro_t2='9' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='6067' pro_nom='CREVETTES CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='3'/>
		<z:row pro_numpro='6066' pro_nom='GRATIN DE VOLAILLE CUISINÉ' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='6063' pro_nom='ROTI DE PORC AVEC FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='6060' pro_nom='OSSO BUCCO DE PORC CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='3'/>
		<z:row pro_numpro='6059' pro_nom='BUCHE GANACHE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='6058' pro_nom='COEUR D&#x27;ARTICHAUT SURGELÉ' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='6057' pro_nom='CROUSTADE D&#x27;ANDOUILLETTE CUITE' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='4'/>
		<z:row pro_numpro='6055' pro_nom='SAUCISSE FUMÉE PRÉCUITE' pro_critere='F18' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='7'/>
		<z:row pro_numpro='6054' pro_nom='ASPIC AUX FRUITS DE MER' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='6053' pro_nom='MAGRET D&#x27;OIE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='6052' pro_nom='VIANDE HACHÉE DE PORC PANÉE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='6051' pro_nom='ACRAS DE MORUE CUITS' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='6'/>
		<z:row pro_numpro='6050' pro_nom='PAVÉ DE BICHE CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='6049' pro_nom='TARTE AUX AMANDES' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='6048' pro_nom='SAMBOS CUITS' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='6'/>
		<z:row pro_numpro='6047' pro_nom='RUMSTECK DE BOEUF CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='6043' pro_nom='FROMAGE FRAIS PASTEURISÉ (F)' pro_critere='O11' pro_t1='0' pro_t2='6' pro_t3='6'
			 pro_t4='2'/>
		<z:row pro_numpro='6042' pro_nom='DÉCOUPE DE SANGLIER CRUE' pro_critere='B2' pro_t1='0' pro_t2='2' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='6040' pro_nom='DÉCOUPE DE BICHE CRUE' pro_critere='B2' pro_t1='0' pro_t2='2' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='6039' pro_nom='DÉCOUPE DE CERF CRUE' pro_critere='B2' pro_t1='0' pro_t2='2' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='6036' pro_nom='BEIGNET DE MOULES PRÉCUIT PANÉ' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='5'/>
		<z:row pro_numpro='6035' pro_nom='POIVRONS CUITS NON ASSAISONNÉS' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='6034' pro_nom='FONDANT CREME AU BEURRE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='6033' pro_nom='HADDOCK MARINÉ' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='6031' pro_nom='FROMAGE A PATE PRESSÉE NC DE CHEVRE AU LAIT CRU' pro_critere='P4' pro_t1='0'
			 pro_t2='6' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='6030' pro_nom='VACHERIN GLACÉ (F)' pro_critere='O15' pro_t1='0' pro_t2='10' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='6029' pro_nom='BALLOTTINE DE GIBIER (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='12'
			 pro_t4='2'/>
		<z:row pro_numpro='6028' pro_nom='FILET DE POISSON PANÉ SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='4'/>
		<z:row pro_numpro='6027' pro_nom='POULET AU FROMAGE ROTI' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='6026' pro_nom='ROTI DE DINDE FARCI CUIT' pro_critere='A2' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='6025' pro_nom='AMANDIER' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='6024' pro_nom='PONT L&#x27;ÉVEQUE AU LAIT PASTEURISÉ' pro_critere='O7' pro_t1='0' pro_t2='6'
			 pro_t3='7' pro_t4='2'/>
		<z:row pro_numpro='6023' pro_nom='ABVT1 PAVÉ DE SAUMON' pro_critere='V14' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='6022' pro_nom='ABVT1 BAR' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='6020' pro_nom='SAUTÉ DE CERF CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='6019' pro_nom='SAUTÉ DE BICHE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='6017' pro_nom='BUCHETTE CREME CHANTILLY S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='6016' pro_nom='MÉDAILLON DE POISSON CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='6015' pro_nom='FROMAGE FRAIS DE CHEVRE AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6'
			 pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='6014' pro_nom='TRUFFE AU CHOCOLAT' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='6011' pro_nom='CORNET DE MOUSSE DE FOIE EN GELÉE' pro_critere='A5' pro_t1='0' pro_t2='8'
			 pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='6010' pro_nom='STEAK HACHÉ DE CHEVAL CRU' pro_critere='B1' pro_t1='0' pro_t2='1' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='6009' pro_nom='GÉNOISE A LA MOUSSE AU CHOCOLAT' pro_critere='P1' pro_t1='0' pro_t2='10'
			 pro_t3='2' pro_t4='4'/>
		<z:row pro_numpro='6008' pro_nom='HOT DOG AVEC FROMAGE, A CUIRE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='4'/>
		<z:row pro_numpro='6007' pro_nom='SAUMON FARCI CUIT' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='19' pro_t4='1'/>
		<z:row pro_numpro='6006' pro_nom='FRICADELLES CUISINÉES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='6005' pro_nom='BEIGNET NATURE CUIT' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='6004' pro_nom='RIS D&#x27;AGNEAU CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='6003' pro_nom='COULIS DE TOMATE CRU &#x22;MAISON&#x22;' pro_critere='X3' pro_t1='0' pro_t2='8'
			 pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='6002' pro_nom='MIXÉ DE LÉGUMES CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='2'/>
		<z:row pro_numpro='6001' pro_nom='FILET DE SAUMON CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='6000' pro_nom='TRIPES MODE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='15' pro_t4='1'/>
		<z:row pro_numpro='5999' pro_nom='PATES ET POISSON CUIT EN SALADE' pro_critere='X22' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='9'/>
		<z:row pro_numpro='5998' pro_nom='PIED DE PORC CUIT (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='14'
			 pro_t4='1'/>
		<z:row pro_numpro='5997' pro_nom='RIZ CUIT EN SALADE' pro_critere='X4' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='9'/>
		<z:row pro_numpro='5996' pro_nom='BLANC DE POULET CUIT FROID' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='9'
			 pro_t4='3'/>
		<z:row pro_numpro='5995' pro_nom='STICK DE POISSON PANE PRÉCUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='6'/>
		<z:row pro_numpro='5994' pro_nom='GÉSIERS DE CANARD CONFITS (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='9'
			 pro_t4='1'/>
		<z:row pro_numpro='5993' pro_nom='PIED DE VEAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5991' pro_nom='FILET DE GRENADIER SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5990' pro_nom='PAVÉ DE BOEUF CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='5989' pro_nom='BOUDIN DE VIANDE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='16' pro_t4='1'/>
		<z:row pro_numpro='5988' pro_nom='POLJEVLEESCH EN GELÉE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='9'
			 pro_t4='2'/>
		<z:row pro_numpro='5986' pro_nom='FILET DE POISSON FRAIS PANÉ' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5985' pro_nom='OEUF MIMOSA' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='15'/>
		<z:row pro_numpro='5984' pro_nom='CARRÉ AU POMMES' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5983' pro_nom='FONDS D&#x27;ARTICHAUTS CUITS NON ASSAISONNÉS' pro_critere='A1' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='5982' pro_nom='TOURNEDOS DE POISSON HACHÉ FRAIS' pro_critere='J2' pro_t1='0' pro_t2='3'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5981' pro_nom='SAUCISSON CUIT FUMÉ (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='5980' pro_nom='NAVARIN DE MOUTON CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='4'/>
		<z:row pro_numpro='5978' pro_nom='ONGLET DE VEAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='5977' pro_nom='APPAREIL A FLAMMICHE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='9'
			 pro_t4='3'/>
		<z:row pro_numpro='5976' pro_nom='LAPIN ENTIER CRU' pro_critere='D2' pro_t1='0' pro_t2='2' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='5975' pro_nom='CRUDITÉS ET SURIMI EN SALADE' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='6'/>
		<z:row pro_numpro='5974' pro_nom='POMMES DE TERRE ET ANCHOIS EN SALADE' pro_critere='X22' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='13'/>
		<z:row pro_numpro='5973' pro_nom='BOUDIN DE VOLAILLE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5972' pro_nom='ABVT1 THON ENTIER' pro_critere='V14' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='5971' pro_nom='SABLÉ CUIT' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5962' pro_nom='MÉLANGE CUIDITÉS CRUDITÉS ET POISSON FUMÉ NON ASSAISONNÉS' pro_critere='X24'
			 pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='13'/>
		<z:row pro_numpro='5961' pro_nom='SAUCE AU FROMAGE BLANC &#x22;MAISON&#x22;' pro_critere='A5' pro_t1='0' pro_t2='8'
			 pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='5960' pro_nom='TAPENADE PASTEURISÉE' pro_critere='M1' pro_t1='0' pro_t2='12' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='5959' pro_nom='BLANC DE DINDE CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5958' pro_nom='CUIDITÉS ET FROMAGE EN SALADE' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='8'/>
		<z:row pro_numpro='5957' pro_nom='TRIPES CUISINÉES (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='15'
			 pro_t4='1'/>
		<z:row pro_numpro='5956' pro_nom='ESCALOPE DE VOLAILLE AVEC FROMAGE CUISINÉE' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='5955' pro_nom='PEPPERONI' pro_critere='G1' pro_t1='0' pro_t2='5' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='5953' pro_nom='TRIANGLE CHANTILLY S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='5952' pro_nom='NOIX DE JOUE DE BOEUF CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5951' pro_nom='AILE DE RAIE FRAICHE' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='5950' pro_nom='MIGNARDISES CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='5949' pro_nom='SALAMBO CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='5948' pro_nom='CORDON BLEU DE JAMBON CUISINÉ' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='2'/>
		<z:row pro_numpro='5947' pro_nom='LENTILLES ET CHARCUTERIE CUITE EN SALADE' pro_critere='X22' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='11'/>
		<z:row pro_numpro='5944' pro_nom='ABVT1 FILET DE SAUMON' pro_critere='V14' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5943' pro_nom='FORET BLANCHE CREME CHANTILLY S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5942' pro_nom='TABOULÉ A LA CHARCUTERIE CUITE' pro_critere='X22' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='9'/>
		<z:row pro_numpro='5941' pro_nom='CONFIT DE MANCHON DE CANARD (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='9'
			 pro_t4='1'/>
		<z:row pro_numpro='5940' pro_nom='POMMES DE TERRE CHARCUTERIE CUITE NON ASSAISONNÉES' pro_critere='X22' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='11'/>
		<z:row pro_numpro='5939' pro_nom='RIZ ET POISSON CUIT EN SALADE' pro_critere='X22' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='13'/>
		<z:row pro_numpro='5937' pro_nom='PAUPIETTE DE DINDE CRUE' pro_critere='F2' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='5936' pro_nom='QUEUE DE LANGOUSTE CRUE CONGELÉE' pro_critere='I1' pro_t1='0' pro_t2='3'
			 pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='5935' pro_nom='CORDON BLEU DE POULET CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5934' pro_nom='MOUSSE D&#x27;AVOCAT' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='18'/>
		<z:row pro_numpro='5933' pro_nom='SEMOULE AU FROMAGE CUISINÉE' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='3'/>
		<z:row pro_numpro='5932' pro_nom='ABONDANCE AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='5930' pro_nom='FRUITS DE MER CUITS EN SALADE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='14'/>
		<z:row pro_numpro='5928' pro_nom='MYSTERE' pro_critere='O1' pro_t1='0' pro_t2='10' pro_t3='6' pro_t4='2'/>
		<z:row pro_numpro='5927' pro_nom='BEIGNET DE CREVETTE CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='6'/>
		<z:row pro_numpro='5926' pro_nom='DÉCOUPE DE FAISAN CRUE' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='5925' pro_nom='BAS CARRÉ DE VEAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='5924' pro_nom='CANAPÉ AUX CRUDITÉS' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='3' pro_t4='5'/>
		<z:row pro_numpro='5923' pro_nom='MAMELLE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='5922' pro_nom='CUIDITÉS EN SALADE' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='4'/>
		<z:row pro_numpro='5921' pro_nom='FRICASSÉE DE VEAU CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='5'/>
		<z:row pro_numpro='5920' pro_nom='GIGOLETTE DE CANARD CRUE' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5919' pro_nom='POIRE CUITE AU SIROP' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='8' pro_t4='3'/>
		<z:row pro_numpro='5918' pro_nom='CONCOMBRE A LA CREME' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='5917' pro_nom='FILET DE CANE CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5916' pro_nom='SALADE COMPOSÉE CUIDITÉS SAUMON ET OEUF MAYONNAISE' pro_critere='X24' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='6'/>
		<z:row pro_numpro='5915' pro_nom='CREPE CHAMPIGNONS ET VOLAILLE CUITE' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='2'/>
		<z:row pro_numpro='5914' pro_nom='CORNET FEUILLETÉ CREME CHANTILLY (D)' pro_critere='P1' pro_t1='0' pro_t2='10'
			 pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='5913' pro_nom='COCKTAIL DE FRUITS DE MER EN SALADE' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='13'/>
		<z:row pro_numpro='5912' pro_nom='CHEESEBURGER AU JAMBON PRÉCUIT' pro_critere='A5' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='2'/>
		<z:row pro_numpro='5911' pro_nom='ROULADE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='12' pro_t4='1'/>
		<z:row pro_numpro='5910' pro_nom='MOULES AU NATUREL (CUITES)' pro_critere='A1' pro_t1='0' pro_t2='3' pro_t3='5'
			 pro_t4='3'/>
		<z:row pro_numpro='5909' pro_nom='VIANDE DE PORC ET VOLAILLE CUITE EN GELÉE' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='9' pro_t4='2'/>
		<z:row pro_numpro='5908' pro_nom='QUENELLES DE VOLAILLE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='18'
			 pro_t4='1'/>
		<z:row pro_numpro='5907' pro_nom='FILET DE SOLE TROPICALE SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5906' pro_nom='FEUILLETE A LA CREME ANGLAISE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='5905' pro_nom='GATEAU AUX POMMES' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5904' pro_nom='SOLE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='5903' pro_nom='SAVARIN' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='5902' pro_nom='BROCHETTE DE DINDE CRUE' pro_critere='F10' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5901' pro_nom='MÉDAILLON DE POISSON SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5900' pro_nom='FILET DE TACAUD FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5899' pro_nom='POISSON PANÉ CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='3'/>
		<z:row pro_numpro='5898' pro_nom='ÉPAULE D&#x27;AGNEAU CUITE FROIDE' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='5897' pro_nom='TRANCHE DE GIGOT D&#x27;AGNEAU CUITE' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='5896' pro_nom='CUIDITÉS ET CREVETTES MAYONNAISE' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='6'/>
		<z:row pro_numpro='5895' pro_nom='CUIDITÉS ET VIANDE EN SALADE' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='5'/>
		<z:row pro_numpro='5894' pro_nom='SALADE COMPOSÉE RIZ SURIMI ET OEUF' pro_critere='X22' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='4'/>
		<z:row pro_numpro='5893' pro_nom='DARNE DE SAUMON CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='3'/>
		<z:row pro_numpro='5892' pro_nom='TRIPES A LA MODE DE CAEN (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='15'
			 pro_t4='1'/>
		<z:row pro_numpro='5891' pro_nom='APPAREIL CRU A FLAMMENKUECHE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='6'
			 pro_t4='8'/>
		<z:row pro_numpro='5890' pro_nom='ROGNONS BLANCS CRUS (D)' pro_critere='B16' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='5889' pro_nom='RIZ CUIT A L&#x27;EAU' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='5'/>
		<z:row pro_numpro='5888' pro_nom='BEURRE MAITRE D&#x27;HOTEL' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='5887' pro_nom='NOIX DE JAMBON CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='5886' pro_nom='ROTI DE VEAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='5885' pro_nom='TARTE AU SAUMON CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='3'/>
		<z:row pro_numpro='5884' pro_nom='NOIX PATISSIERE DE VEAU CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='5883' pro_nom='BRILLAT SAVARIN AU LAIT PASTEURISÉ' pro_critere='O7' pro_t1='0' pro_t2='6'
			 pro_t3='7' pro_t4='2'/>
		<z:row pro_numpro='5882' pro_nom='ROTI DE BICHE CRU' pro_critere='B2' pro_t1='0' pro_t2='2' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='5881' pro_nom='PAVÉ DE BICHE CRU' pro_critere='B2' pro_t1='0' pro_t2='2' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='5880' pro_nom='PAVÉ A LA VIANDE CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='4'/>
		<z:row pro_numpro='5879' pro_nom='MIXÉ JAMBON OEUF CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='5878' pro_nom='CHAMPIGNONS CUITS NON ASSAISONNÉS' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='5877' pro_nom='PATÉ DE TETE PERSILLÉ (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='14'
			 pro_t4='1'/>
		<z:row pro_numpro='5876' pro_nom='CHAOURCE AU LAIT PASTEURISÉ' pro_critere='O7' pro_t1='0' pro_t2='6' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='5875' pro_nom='POMMES DE TERRE ET THON NON ASSAISONNÉS' pro_critere='X22' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='13'/>
		<z:row pro_numpro='5874' pro_nom='BEURRE DE SAUMON FUMÉ' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='5873' pro_nom='NOIX DE BASSE COTE DE BOEUF CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5872' pro_nom='BEIGNET DE LEGUMES PRÉCUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='5871' pro_nom='LANGRES AU LAIT PASTEURISÉ' pro_critere='O7' pro_t1='0' pro_t2='6' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='5869' pro_nom='EMMENTAL AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='5868' pro_nom='POMMES DE TERRE FRITES CUITES' pro_critere='A1' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='3'/>
		<z:row pro_numpro='5867' pro_nom='MOUSSE DE FROMAGE BLANC AUX FRUITS' pro_critere='O3' pro_t1='0' pro_t2='6'
			 pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='5866' pro_nom='RISSOLETTE DE PORC PANÉE PRÉCUITE' pro_critere='F10' pro_t1='0' pro_t2='9'
			 pro_t3='6' pro_t4='7'/>
		<z:row pro_numpro='5865' pro_nom='TOMATE FARCIE PRÉCUITE' pro_critere='F4' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='7'/>
		<z:row pro_numpro='5864' pro_nom='COQUILLE AU SURIMI MAYONNAISE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='6'/>
		<z:row pro_numpro='5863' pro_nom='CARRÉ DE VEAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='5862' pro_nom='PINTADE ENTIERE CRUE' pro_critere='F5' pro_t1='0' pro_t2='2' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='5860' pro_nom='FILET DE TAUREAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='5858' pro_nom='FEUILLETÉ AU JAMBON ET FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='5857' pro_nom='FILET DE MERLU PANÉ SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='4'/>
		<z:row pro_numpro='5856' pro_nom='PATES FRAICHES' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5855' pro_nom='CRUDITÉS AVEC VIANDE ET OEUF DUR NON ASSAISONNÉS' pro_critere='X24' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='8'/>
		<z:row pro_numpro='5854' pro_nom='ÉPOISSES AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='5853' pro_nom='LENTILLES ET GÉSIERS CONFITS EN SALADE' pro_critere='X22' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='12'/>
		<z:row pro_numpro='5852' pro_nom='SOUFFLÉ GLACÉ (F)' pro_critere='O15' pro_t1='0' pro_t2='10' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='5851' pro_nom='LENTILLES ET CHARCUTERIE CUITE NON ASSAISONNÉE' pro_critere='X22' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='11'/>
		<z:row pro_numpro='5850' pro_nom='ROTI DE DINDONNEAU CUIT' pro_critere='A2' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5849' pro_nom='PAUPIETTE DE SAUMON FRAICHE' pro_critere='J2' pro_t1='0' pro_t2='3' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='5848' pro_nom='FETA AU LAIT PASTEURISÉ' pro_critere='O7' pro_t1='0' pro_t2='6' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='5846' pro_nom='CRUDITÉS ASSAISONNÉES' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='5845' pro_nom='BOISSON A BASE DE POTAGE DÉSHYDRATÉ' pro_critere='A1' pro_t1='0' pro_t2='11'
			 pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='5844' pro_nom='BEIGNET DE VOLAILLE CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='4'/>
		<z:row pro_numpro='5843' pro_nom='FARCE DE CRABE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='3'/>
		<z:row pro_numpro='5842' pro_nom='ABVT2 LISETTE' pro_critere='V14' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='5841' pro_nom='ROTI DE LAPIN FARCI CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5839' pro_nom='PATÉ BRETON (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='5838' pro_nom='SAUMON HACHÉ FRAIS' pro_critere='J2' pro_t1='0' pro_t2='3' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5837' pro_nom='SUCCES CREME AU BEURRE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5835' pro_nom='CHAUSSON SAUCE BOLOGNAISE CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='5834' pro_nom='ÉMINCÉ DE VEAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='5833' pro_nom='SOUFFLÉ AU COINTREAU' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='5832' pro_nom='MERVEILLEUX CREME AU BEURRE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5831' pro_nom='AIGUILLETTE DE BOEUF CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5830' pro_nom='RICOTTA AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='11' pro_t4='1'/>
		<z:row pro_numpro='5829' pro_nom='CHOU FLEUR CRU NON ASSAISONNÉ' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='5'/>
		<z:row pro_numpro='5828' pro_nom='RIZ ET THON ET OEUF NON ASSAISONNÉS' pro_critere='X22' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='4'/>
		<z:row pro_numpro='5827' pro_nom='CUIDITÉS CRUDITÉS JAMBON SEC ET FROMAGE NON ASSAISONNÉS' pro_critere='X28'
			 pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='5'/>
		<z:row pro_numpro='5826' pro_nom='CRUDITÉS AVEC VIANDE SAUMURÉE ET OEUF DUR NON ASSAISONNÉS' pro_critere='X24'
			 pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='5'/>
		<z:row pro_numpro='5825' pro_nom='CRUDITÉS AVEC FROMAGE ET CHARCUTERIE CUITE NON ASSAISONNÉES' pro_critere='X24'
			 pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='5'/>
		<z:row pro_numpro='5823' pro_nom='SAUMON FUMÉ EN GELÉE' pro_critere='A8' pro_t1='0' pro_t2='8' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5822' pro_nom='SORBET' pro_critere='O1' pro_t1='0' pro_t2='10' pro_t3='6' pro_t4='3'/>
		<z:row pro_numpro='5821' pro_nom='CARPACCIO DE POISSON' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5820' pro_nom='PAIN AU CHOCOLAT' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='5819' pro_nom='MILLE-FEUILLE CREME CHANTILLY S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5818' pro_nom='HARICOTS BLANCS NON ASSAISONNÉS' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='5816' pro_nom='TARTE FLAMBÉE PRÉCUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='9'/>
		<z:row pro_numpro='5815' pro_nom='FILET DE DINDONNEAU CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5813' pro_nom='MAGRET DE CANARD CUIT FROID' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='9'
			 pro_t4='3'/>
		<z:row pro_numpro='5812' pro_nom='CONFIT DE CUISSE DE POULE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='9'
			 pro_t4='1'/>
		<z:row pro_numpro='5811' pro_nom='FRUITS FRAIS EN GELÉE' pro_critere='X6' pro_t1='0' pro_t2='10' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='5810' pro_nom='RIZ ET VIANDE CUITE EN SALADE' pro_critere='X22' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='9'/>
		<z:row pro_numpro='5808' pro_nom='MOULES CUITES DÉCOQUILLÉES SAUMURÉES' pro_critere='A1' pro_t1='0' pro_t2='3'
			 pro_t3='5' pro_t4='3'/>
		<z:row pro_numpro='5807' pro_nom='ABVT1 BROCHETTE DE POISSON' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5806' pro_nom='MIXÉ DE CHARCUTERIES CUITES (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='22'
			 pro_t4='1'/>
		<z:row pro_numpro='5805' pro_nom='ABVT1 FILET DE RASCASSE' pro_critere='V10' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5804' pro_nom='TARTE AUX FRUITS CUITE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='5802' pro_nom='STEAK DE THON CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='5801' pro_nom='STEAK DE THON CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='5800' pro_nom='PAIN DE VIANDE CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5799' pro_nom='FOIE DE VOLAILLE CUIT EN GELÉE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5798' pro_nom='TRONÇON DE SAUMONETTE SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5797' pro_nom='OSEILLE HACHÉE SURGELÉE' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5796' pro_nom='GELÉE SUCRÉE AROMATISÉE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='5795' pro_nom='BEIGNET AUX POMMES' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='5794' pro_nom='ÉCREVISSE CUITE' pro_critere='I2' pro_t1='0' pro_t2='3' pro_t3='7' pro_t4='3'/>
		<z:row pro_numpro='5793' pro_nom='SAUCE CHOCOLAT' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='5792' pro_nom='DARNE DE MERLU SURGELÉE' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5791' pro_nom='JAMBONNETTE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='12' pro_t4='2'/>
		<z:row pro_numpro='5790' pro_nom='ASPIC OEUF SAUMON FUMÉ' pro_critere='A8' pro_t1='0' pro_t2='8' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5789' pro_nom='SAUCISSE PRÉCUITE' pro_critere='F18' pro_t1='0' pro_t2='9' pro_t3='6' pro_t4='7'/>
		<z:row pro_numpro='5788' pro_nom='FILET DE CARDINAL FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5787' pro_nom='OMELETTE NATURE FROIDE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='15'/>
		<z:row pro_numpro='5786' pro_nom='OIGNONS CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='5785' pro_nom='NOIX D&#x27;ENTRECOTE DE BOEUF CRUE' pro_critere='B2' pro_t1='0' pro_t2='1'
			 pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='5784' pro_nom='ASPIC LANGOUSTINE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='5783' pro_nom='TARTE FLAMBÉE (FLAMMENKUECHE) CRUE' pro_critere='A5' pro_t1='0' pro_t2='8'
			 pro_t3='6' pro_t4='9'/>
		<z:row pro_numpro='5782' pro_nom='DAVICROQ PRÉCUIT' pro_critere='F8' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='5'/>
		<z:row pro_numpro='5781' pro_nom='CONFIT DE CANARD (D) DÉCONDITIONNÉ' pro_critere='A5' pro_t1='0' pro_t2='5'
			 pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='5780' pro_nom='GRATIN DE VIANDE AU FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='5779' pro_nom='TOMATE FARCIE AU POISSON MAYONNAISE' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='13'/>
		<z:row pro_numpro='5778' pro_nom='VIANDE HACHÉE D&#x27;AGNEAU CUITE' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5777' pro_nom='FILET DE PINTADE CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5775' pro_nom='POISSON CUIT FROID MAYONNAISE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='5774' pro_nom='GAUFRE A LA CHANTILLY S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5770' pro_nom='CERVELLE D&#x27;AGNEAU CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5769' pro_nom='PIERRADE DE BOEUF CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5768' pro_nom='ACRAS DE POISSON CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='6'/>
		<z:row pro_numpro='5766' pro_nom='JOUE DE LOTTE FRAICHE' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5765' pro_nom='ASPIC CREVETTES' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='5764' pro_nom='ROTI DE BOEUF HACHÉ CUIT TRANCHÉ' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5762' pro_nom='ABVT3 AILE DE RAIE' pro_critere='V15' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='3'/>
		<z:row pro_numpro='5761' pro_nom='ASPIC MOUSSE DE CREVETTE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5759' pro_nom='BOULGOUR CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='3'/>
		<z:row pro_numpro='5758' pro_nom='DÉLICES SOUFFLÉS AU FROMENT (D)' pro_critere='A5' pro_t1='0' pro_t2='5'
			 pro_t3='18' pro_t4='1'/>
		<z:row pro_numpro='5757' pro_nom='FILET DE POISSON AU FROMAGE CUISINÉ' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='5756' pro_nom='ASPIC DE LAPIN' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='5755' pro_nom='AILERON DE CANARD CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5753' pro_nom='CARRÉ DE PORC CUIT FROID' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='9'
			 pro_t4='2'/>
		<z:row pro_numpro='5752' pro_nom='PIERRADE DE PORC CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='5751' pro_nom='FILET DE DINDE CUIT FROID' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='9'
			 pro_t4='3'/>
		<z:row pro_numpro='5750' pro_nom='GLACE' pro_critere='O1' pro_t1='0' pro_t2='10' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='5749' pro_nom='SAUCISSE FUMÉE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='5748' pro_nom='TARTARE DE POISSON FRAIS' pro_critere='J2' pro_t1='0' pro_t2='3' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='5747' pro_nom='GRILLETTE DE PORC PANÉE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='5746' pro_nom='STEAK HACHÉ DE POISSON SURGELÉ' pro_critere='J5' pro_t1='0' pro_t2='3' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='5745' pro_nom='BOULETTES DE VOLAILLE CUITES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='4'/>
		<z:row pro_numpro='5744' pro_nom='STEAK DE THON SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5743' pro_nom='CUIDITÉS CRUDITÉS ET ABATS CUITS NON ASSAISONNÉS' pro_critere='X24' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='5'/>
		<z:row pro_numpro='5742' pro_nom='SAINT FÉLICIEN AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='5741' pro_nom='PAUPIETTE DE POISSON SURGELÉE' pro_critere='J5' pro_t1='0' pro_t2='3' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='5740' pro_nom='DARNE DE SAUMON SURGELÉE' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5739' pro_nom='COULE D&#x27;OEUF PASTEURISÉE' pro_critere='P2' pro_t1='0' pro_t2='7' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='5738' pro_nom='TETE DE PORC EN GELÉE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='14'
			 pro_t4='1'/>
		<z:row pro_numpro='5737' pro_nom='OEUF FLORENTINE CUISINÉ' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='5735' pro_nom='ÉPAULE CUITE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5734' pro_nom='TUILES' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5733' pro_nom='CORDON BLEU DE VEAU CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='5732' pro_nom='PARMENTIER DE POISSON CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='3'/>
		<z:row pro_numpro='5730' pro_nom='FILET DE HOKI SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5729' pro_nom='OS A MOELLE CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='5728' pro_nom='BRILLAT SAVARIN AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='5727' pro_nom='SAUTÉ DE VIANDES CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='5726' pro_nom='FILET DE DINDONNEAU CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5725' pro_nom='SALSIFIS CUITS NON ASSAISONNÉS' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='5724' pro_nom='BACON CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='5723' pro_nom='TERRINE DE SAINT JACQUES' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='19'
			 pro_t4='1'/>
		<z:row pro_numpro='5722' pro_nom='MOULES DÉCOQUILLÉES CUITES' pro_critere='I3' pro_t1='0' pro_t2='3' pro_t3='5'
			 pro_t4='3'/>
		<z:row pro_numpro='5721' pro_nom='GRATIN DE VIANDE HACHÉE AVEC FROMAGE CUISINÉ' pro_critere='Z5' pro_t1='0'
			 pro_t2='9' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5719' pro_nom='FENOUIL CUIT NON ASSAISONNÉ' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='5718' pro_nom='CREVETTES CUITES EN SALADE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='13'/>
		<z:row pro_numpro='5716' pro_nom='MAKOCZ' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5715' pro_nom='VINAIGRETTE PASTEURISÉE' pro_critere='M1' pro_t1='0' pro_t2='12' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='5714' pro_nom='TOMME AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='5713' pro_nom='SANDWICH CRUDITÉS ET CRABE' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='7'/>
		<z:row pro_numpro='5712' pro_nom='CUIDITÉS CRUDITÉS ET VOLAILLE NON ASSAISONNÉS' pro_critere='X24' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='11'/>
		<z:row pro_numpro='5711' pro_nom='AVOCAT AUX CREVETTES MAYONNAISE' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='13'/>
		<z:row pro_numpro='5710' pro_nom='QUICHE AU POISSON CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='8'/>
		<z:row pro_numpro='5709' pro_nom='ASPIC LÉGUMES CUITS ET POISSON' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5708' pro_nom='MOUSSE DE FRUITS DE MER' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='19'
			 pro_t4='1'/>
		<z:row pro_numpro='5707' pro_nom='ESCALOPE DE DINDE PANÉE CRUE' pro_critere='F10' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5705' pro_nom='FILET D&#x27;AGNEAU CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='5704' pro_nom='APPAREIL A PIZZA' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='5703' pro_nom='TARTE A LA NOIX DE COCO' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='5702' pro_nom='BOUILLABAISSE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='5701' pro_nom='COCKTAIL DE FRUITS DE MER PRÉCUIT' pro_critere='J3' pro_t1='0' pro_t2='3'
			 pro_t3='12' pro_t4='1'/>
		<z:row pro_numpro='5700' pro_nom='AVOCAT AU CRABE MAYONNAISE' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='13'/>
		<z:row pro_numpro='5697' pro_nom='FEUILLETÉ CRU AUX JAMBON ET CHAMPIGNONS' pro_critere='A5' pro_t1='0' pro_t2='8'
			 pro_t3='6' pro_t4='9'/>
		<z:row pro_numpro='5696' pro_nom='TARTE AU CHOCOLAT' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5694' pro_nom='SANDWICH CRUDITÉS ET OEUF' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='7'/>
		<z:row pro_numpro='5693' pro_nom='FRUITS FRAIS AU FROMAGE BLANC' pro_critere='X6' pro_t1='0' pro_t2='10' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='5692' pro_nom='CREME BAVAROISE M' pro_critere='P3' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='5691' pro_nom='ASPIC THON MACÉDOINE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='5689' pro_nom='FRAISIER (D)' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='5688' pro_nom='TERRINE DE VEAU (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='5687' pro_nom='ROULÉ AUX HERBES AU LAIT PASTEURISÉ' pro_critere='O7' pro_t1='0' pro_t2='6'
			 pro_t3='7' pro_t4='2'/>
		<z:row pro_numpro='5686' pro_nom='GNOCCHIS AVEC FROMAGE CUISINÉS' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='3'/>
		<z:row pro_numpro='5685' pro_nom='OEUF AVEC FROMAGE CUISINÉ' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='5683' pro_nom='TARTARE DE SAUMON FRAIS' pro_critere='J2' pro_t1='0' pro_t2='3' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='5682' pro_nom='COEURS D&#x27;ARTICHAUTS ASSAISONNÉS' pro_critere='X6' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='5681' pro_nom='OMELETTE NORVÉGIENNE' pro_critere='O1' pro_t1='0' pro_t2='10' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='5680' pro_nom='LANGUE DE PORC CRUE (F)' pro_critere='B15' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='5679' pro_nom='BLANC DE DINDONNEAU TRAITÉ EN SALAISON CUIT (D)' pro_critere='A5' pro_t1='0'
			 pro_t2='5' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='5678' pro_nom='COEURS D&#x27;ARTICHAUTS CUITS NON ASSAISONNÉS' pro_critere='A1' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='5677' pro_nom='COCKTAIL DE FRUITS DE MER CUIT' pro_critere='A1' pro_t1='0' pro_t2='3' pro_t3='12'
			 pro_t4='1'/>
		<z:row pro_numpro='5676' pro_nom='POMMES DE TERRE ET FILET DE HARENG FUMÉ EN SALADE' pro_critere='X22' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='13'/>
		<z:row pro_numpro='5675' pro_nom='ROULADE AU JAMBON (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='12'
			 pro_t4='2'/>
		<z:row pro_numpro='5672' pro_nom='POITRINE DE PORC SAUMURÉE CUITE (F)' pro_critere='A1' pro_t1='0' pro_t2='5'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5671' pro_nom='CERNEAUX DE NOIX' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='5670' pro_nom='TABOULÉ AU POISSON' pro_critere='X22' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='9'/>
		<z:row pro_numpro='5669' pro_nom='CHAUD FROID DE VOLAILLE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='9'
			 pro_t4='3'/>
		<z:row pro_numpro='5668' pro_nom='PLAT DE COTE DE PORC DEMI SEL CRU' pro_critere='F3' pro_t1='0' pro_t2='5'
			 pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='5667' pro_nom='BROCHETTE DE BOEUF CRUE' pro_critere='F10' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5666' pro_nom='GIGOT DE DINDONNEAU CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5664' pro_nom='TRANCHE DE TRUITE DE MER FRAICHE' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5663' pro_nom='SAMOSSA CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='6'/>
		<z:row pro_numpro='5662' pro_nom='FLAN DE FOIE GRAS CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='5661' pro_nom='GODIVEAU CRU' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='5660' pro_nom='MORBIER AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='5659' pro_nom='PIED DE PORC PANÉ CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='14'
			 pro_t4='1'/>
		<z:row pro_numpro='5658' pro_nom='SUNDAE' pro_critere='O1' pro_t1='0' pro_t2='10' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='5657' pro_nom='CRUDITÉS ET OEUF DUR NON ASSAISONNÉS' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='15'/>
		<z:row pro_numpro='5655' pro_nom='STICK DE POISSON PANE PRÉCUIT SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='9'
			 pro_t3='5' pro_t4='6'/>
		<z:row pro_numpro='5654' pro_nom='ABVT1 CHINCHARD' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='5652' pro_nom='CREME DESSERT' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='5651' pro_nom='RIZ CUIT NON ASSAISONNÉ' pro_critere='X4' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='8'/>
		<z:row pro_numpro='5649' pro_nom='COQUILLE DE SAUMON CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='3'/>
		<z:row pro_numpro='5648' pro_nom='ABVT3 ROUSSETTE' pro_critere='V15' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='5647' pro_nom='SALADE CUIDITÉS CRUDITÉS ET JAMBON CRU' pro_critere='X28' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='11'/>
		<z:row pro_numpro='5646' pro_nom='CREPE AUX FRUITS' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='5645' pro_nom='BLANC DE SEICHE SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='5643' pro_nom='CREPE AU JAMBON CUITE ET FROMAGE A CUIRE' pro_critere='A5' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='2'/>
		<z:row pro_numpro='5642' pro_nom='GATEAU A LA MERINGUE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='5641' pro_nom='CREME GLACÉE (F)' pro_critere='O15' pro_t1='0' pro_t2='10' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='5640' pro_nom='BRIOCHE CREME MOUSSELINE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='5639' pro_nom='POMMES DE TERRE NON ASSAISONNÉES' pro_critere='X4' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='5637' pro_nom='CANAPÉ DE SARDINES' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='3' pro_t4='4'/>
		<z:row pro_numpro='5636' pro_nom='FEUILLETÉ DE LÉGUMES AU FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='9'/>
		<z:row pro_numpro='5634' pro_nom='FRUITS FRAIS TRANCHÉS' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='1'
			 pro_t4='7'/>
		<z:row pro_numpro='5633' pro_nom='POMMES DE TERRE CRUES ENTIERES ÉPLUCHÉES (D)' pro_critere='X3' pro_t1='0'
			 pro_t2='4' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='5632' pro_nom='THON FUMÉ' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='5631' pro_nom='FRAISIER CREME MOUSSELINE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='5630' pro_nom='CREVETTES ENTIERES CRUES CONGELÉES' pro_critere='I1' pro_t1='0' pro_t2='3'
			 pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='5629' pro_nom='EMMENTAL RAPÉ AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='5628' pro_nom='POITRINE DE PORC SALÉE CRUE' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='5627' pro_nom='PROFITEROLES' pro_critere='O1' pro_t1='0' pro_t2='10' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='5626' pro_nom='SAUTE DE POULET CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='3'/>
		<z:row pro_numpro='5625' pro_nom='POMMES DE TERRE CHARCUTERIE CUITE MAYONNAISE' pro_critere='X22' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='11'/>
		<z:row pro_numpro='5624' pro_nom='FEUILLETÉ A LA FRANGIPANE CUIT' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='5623' pro_nom='CROUTE AUX CHAMPIGNONS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='5622' pro_nom='CRÉPINETTE DE PORC CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='5620' pro_nom='FILET DE MOSTELLE FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5619' pro_nom='NOIX D&#x27;ENTRECOTE CRUE P' pro_critere='E1' pro_t1='0' pro_t2='1' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='5618' pro_nom='CERVELAS OBERNOIS (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='5617' pro_nom='CONFIT DE POULE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='2'/>
		<z:row pro_numpro='5616' pro_nom='CONFIT DE PORC (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='9' pro_t4='2'/>
		<z:row pro_numpro='5615' pro_nom='FRUITS FRAIS A LA CREME FRAICHE' pro_critere='X6' pro_t1='0' pro_t2='10' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='5614' pro_nom='SELLE D&#x27;AGNEAU CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='5613' pro_nom='CHAMPIGNONS CRUS TRANCHÉS' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='5612' pro_nom='LANGOUSTINE CRUE' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='7' pro_t4='6'/>
		<z:row pro_numpro='5611' pro_nom='RILLETTE DE POISSON' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='19' pro_t4='1'/>
		<z:row pro_numpro='5610' pro_nom='POMME CUITE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='8' pro_t4='3'/>
		<z:row pro_numpro='5609' pro_nom='CRABE FARCI AU FROMAGE CUISINÉ' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='3'/>
		<z:row pro_numpro='5608' pro_nom='ROULADE DE VOLAILLE CUITE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='12'
			 pro_t4='1'/>
		<z:row pro_numpro='5607' pro_nom='MOUSSE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='4'/>
		<z:row pro_numpro='5605' pro_nom='FEUILLETE A LA CREME D&#x27;AMANDE A CUIRE' pro_critere='A6' pro_t1='0' pro_t2='10'
			 pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='5604' pro_nom='CRABE FARCI CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='6'/>
		<z:row pro_numpro='5603' pro_nom='CUIDITÉS ET OEUFS DURS EN SALADE' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='7'/>
		<z:row pro_numpro='5602' pro_nom='SAUCISSE CUITE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='5601' pro_nom='COULIS DE FRUITS SURGELÉ' pro_critere='A1' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='6'/>
		<z:row pro_numpro='5600' pro_nom='PAMPLEMOUSSE FRAIS TRANCHÉ' pro_critere='X3' pro_t1='0' pro_t2='10' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='5599' pro_nom='CRUDITÉS ET CUIDITÉS ASSAISONNÉES' pro_critere='X6' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='5598' pro_nom='FRICASSÉE DE PORC CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='5596' pro_nom='BLANQUETTE DE POISSON CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='5595' pro_nom='SANDWICH CRUDITÉS ET SURIMI' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='7'/>
		<z:row pro_numpro='5593' pro_nom='PURÉE DE FRUITS FRAIS SURGELÉE' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='6'/>
		<z:row pro_numpro='5592' pro_nom='CASSOLETTE DE FRUITS DE MER CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='5' pro_t4='3'/>
		<z:row pro_numpro='5591' pro_nom='CERVELLE DE PORC CRUE (F)' pro_critere='B15' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='5590' pro_nom='TERRINE DE SAUMON FUMÉ' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='19'
			 pro_t4='1'/>
		<z:row pro_numpro='5589' pro_nom='POIRIER CREME CHANTILLY S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5588' pro_nom='BALLOTTINE DE CANARD (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='12'
			 pro_t4='2'/>
		<z:row pro_numpro='5587' pro_nom='TOMATE AU THON' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='13'/>
		<z:row pro_numpro='5586' pro_nom='DÉCOUPE DE VEAU CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='5585' pro_nom='PUDDING CREME ANGLAISE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='5584' pro_nom='CORDON BLEU DE POISSON CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='3'/>
		<z:row pro_numpro='5583' pro_nom='FILET DE HARENG SAUR EN SALADE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='14'/>
		<z:row pro_numpro='5582' pro_nom='PATÉ A L&#x27;AIL (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='2'/>
		<z:row pro_numpro='5581' pro_nom='PAUPIETTE DE VEAU CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='5580' pro_nom='CAKE AUX OLIVES' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='9'/>
		<z:row pro_numpro='5579' pro_nom='SALADE COMPOSÉE CRUDITÉS FROMAGE ET CHARCUTERIE CUITE' pro_critere='X24'
			 pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='18'/>
		<z:row pro_numpro='5578' pro_nom='CUISSE DE POULE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5577' pro_nom='CÉLERI RAPÉ MAYONNAISE' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='5576' pro_nom='GATEAU ROULÉ' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5573' pro_nom='FILET DE HADDOCK' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='5572' pro_nom='FENOUIL CUIT ASSAISONNÉ' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='5571' pro_nom='TARTE SOUFFLÉE AUX FRUITS' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='5570' pro_nom='MERINGUE A LA CREME AU BEURRE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5569' pro_nom='PINTADEAU FARCI CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5568' pro_nom='ESCALOPE DE DINDE PANÉE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5565' pro_nom='STEAK DE PORC CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='5564' pro_nom='STEAK HACHÉ DE VEAU PRÉCUIT' pro_critere='B1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='5563' pro_nom='BEIGNET DE POISSON PRÉCUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='4'/>
		<z:row pro_numpro='5562' pro_nom='ABATS CUITS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='5561' pro_nom='MACARON' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5560' pro_nom='SANDWICH AUX OEUFS DE LUMP' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='4'/>
		<z:row pro_numpro='5559' pro_nom='ABVT1 COLINOT' pro_critere='V12' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='5558' pro_nom='ASPIC JAMBON CUIT MACÉDOINE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5556' pro_nom='ROTI DE VIANDE BLANCHE HACHÉE CUIT' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='4' pro_t4='3'/>
		<z:row pro_numpro='5555' pro_nom='CROISSANT JAMBON FROMAGE A CUIRE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='5554' pro_nom='JAMBONETTE DE VOLAILLE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5553' pro_nom='QUEUE DE LOTTE FRAICHE' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5552' pro_nom='CANTAL AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='5551' pro_nom='VIANDE DE BOEUF CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='5550' pro_nom='FILET DE POULET CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5549' pro_nom='BRIOCHE FOURRÉE AU JAMBON (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='13'
			 pro_t4='2'/>
		<z:row pro_numpro='5548' pro_nom='SALADE CUIDITÉS CRUDITÉS AUX HARENGS FUMÉS' pro_critere='X24' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='6'/>
		<z:row pro_numpro='5547' pro_nom='RIZ ET CHORIZO NON ASSAISONNÉS' pro_critere='X26' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='8'/>
		<z:row pro_numpro='5546' pro_nom='ABVT1 COQ ROUGE' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='5545' pro_nom='CRUSTACÉS CUITS EN SALADE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='14'/>
		<z:row pro_numpro='5544' pro_nom='MERGUEZ CUITES SOUS VIDE' pro_critere='A5' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='5543' pro_nom='COTE D&#x27;AGNEAU PRÉCUITE' pro_critere='B2' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='4'/>
		<z:row pro_numpro='5542' pro_nom='MAGRET DE CANARD PRÉCUIT' pro_critere='F1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='3'/>
		<z:row pro_numpro='5540' pro_nom='CUIDITÉS ET THON EN SALADE' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='6'/>
		<z:row pro_numpro='5539' pro_nom='CREME AU CHOCOLAT' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='5538' pro_nom='CANETTE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='5537' pro_nom='TRAVERS DE PORC CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='5536' pro_nom='ÉPAULE DE PORC CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='5535' pro_nom='TARTELETTE A LA GANACHE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5534' pro_nom='FEUILLETÉ DE POISSON CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='5'/>
		<z:row pro_numpro='5533' pro_nom='FILET DE MERLAN PANÉ SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='4'/>
		<z:row pro_numpro='5532' pro_nom='SAUCISSE DE FOIE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='5531' pro_nom='PAVÉ AU POIVRE' pro_critere='G1' pro_t1='0' pro_t2='5' pro_t3='7' pro_t4='2'/>
		<z:row pro_numpro='5530' pro_nom='PALETTE A LA DIABLE CRUE' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5529' pro_nom='RUMSTECK DE CHEVAL CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='5'/>
		<z:row pro_numpro='5528' pro_nom='FILET DE CHEVAL CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='5'/>
		<z:row pro_numpro='5527' pro_nom='JAMBON MACÉDOINE DE LÉGUMES MAYONNAISE' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='11'/>
		<z:row pro_numpro='5526' pro_nom='CREME MANIPULÉE POUR CHANTILLY S' pro_critere='P1' pro_t1='0' pro_t2='6'
			 pro_t3='3' pro_t4='3'/>
		<z:row pro_numpro='5524' pro_nom='RILLONS (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='5523' pro_nom='TRANCHE DE SAUMONETTE FRAICHE' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5522' pro_nom='SAUCISSE PAYSANNE CUITE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='5521' pro_nom='ENDIVE CUITE AVEC FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='2'/>
		<z:row pro_numpro='5520' pro_nom='TOMATE AUX CREVETTES' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='13'/>
		<z:row pro_numpro='5519' pro_nom='FILET D&#x27;ANCHOIS SALÉ' pro_critere='M6' pro_t1='0' pro_t2='3' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='5518' pro_nom='CHOCOLAT FONDANT' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='5517' pro_nom='HUITRES DÉCOQUILLÉES FRAICHES' pro_critere='J3' pro_t1='0' pro_t2='3' pro_t3='5'
			 pro_t4='3'/>
		<z:row pro_numpro='5516' pro_nom='CERVELLE DE MOUTON CRUE (D)' pro_critere='B16' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='3'/>
		<z:row pro_numpro='5515' pro_nom='SAVARIN CREME CHANTILLY S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5514' pro_nom='FEUILLETÉ CRU AU POISSON CUIT' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='6'
			 pro_t4='3'/>
		<z:row pro_numpro='5513' pro_nom='LANGOUSTINE CUITE FRAICHE' pro_critere='A1' pro_t1='0' pro_t2='3' pro_t3='7'
			 pro_t4='3'/>
		<z:row pro_numpro='5512' pro_nom='GRILLADE DE PORC CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='5510' pro_nom='ENDIVE AU JAMBON ET FROMAGE CUITE' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='5509' pro_nom='FRUITS A LA CREME ANGLAISE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='5508' pro_nom='ABVT1 FILET DE TACAUD' pro_critere='V12' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5506' pro_nom='SAUMON CUIT FROID' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='5505' pro_nom='RIZ ET FRUITS DE MER NON ASSAISONNÉS' pro_critere='X22' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='8'/>
		<z:row pro_numpro='5504' pro_nom='ABVT3 SAUMONETTE' pro_critere='V15' pro_t1='0' pro_t2='3' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='5503' pro_nom='ABVT2 FILET DE LIEU NOIR' pro_critere='V12' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5502' pro_nom='CUIDITÉS ET CHARCUTERIE CUITE EN SALADE' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='5'/>
		<z:row pro_numpro='5501' pro_nom='FILET DE PORC TRAITÉ EN SALAISON CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5499' pro_nom='LAIT FERMENTÉ PASTEURISÉ' pro_critere='O2' pro_t1='0' pro_t2='6' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='5498' pro_nom='PAUPIETTE DE SAUMON CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='5497' pro_nom='FLAN DE MOULES CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='5496' pro_nom='TARTE CRUE AU FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='6' pro_t4='8'/>
		<z:row pro_numpro='5495' pro_nom='PATÉ DE LIEVRE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10' pro_t4='2'/>
		<z:row pro_numpro='5494' pro_nom='SANDWICH CRUDITÉS ET CREVETTES' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='7'/>
		<z:row pro_numpro='5493' pro_nom='CUISSE DE POULE FARCIE CUISINÉE' pro_critere='A2' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='3'/>
		<z:row pro_numpro='5492' pro_nom='RAVIOLIS CUITS AVEC FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='4'/>
		<z:row pro_numpro='5491' pro_nom='SEMELLE DE BOEUF CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='5490' pro_nom='FICELLE PICARDE A CUIRE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='5489' pro_nom='OEUF AU PLAT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='5488' pro_nom='NOUGAT GLACÉ' pro_critere='O1' pro_t1='0' pro_t2='10' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='5487' pro_nom='COLLIER D&#x27;AGNEAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='5486' pro_nom='SANDWICH AU SAUMON CUIT' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='4'/>
		<z:row pro_numpro='5485' pro_nom='STEAK HACHÉ DE VEAU AVEC FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5484' pro_nom='BAVETTE D&#x27;ALOYAU DE BOEUF CRUE' pro_critere='B2' pro_t1='0' pro_t2='1'
			 pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='5483' pro_nom='TOURNEDOS DE VOLAILLE CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5482' pro_nom='GRATIN DE POISSON AU FROMAGE CUISINÉ' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='5481' pro_nom='ABVT1 PAGRE' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='5480' pro_nom='PAIN AU LAIT' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='5479' pro_nom='CREME UHT DÉCONDITIONNÉE' pro_critere='O4' pro_t1='0' pro_t2='6' pro_t3='3'
			 pro_t4='3'/>
		<z:row pro_numpro='5477' pro_nom='BROWNIES' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5476' pro_nom='FILET DE CANARD CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5474' pro_nom='TARTARE DE SAUMON FRAIS DÉCONGELÉ' pro_critere='J5' pro_t1='0' pro_t2='3'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5473' pro_nom='TARTARE DE SAUMON FRAIS SURGELÉ' pro_critere='J5' pro_t1='0' pro_t2='3' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='5471' pro_nom='TARTE A L&#x27;ORANGE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='5470' pro_nom='ESCALOPE DE VOLAILLE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5467' pro_nom='TOURTE A LA VOLAILLE CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='4'/>
		<z:row pro_numpro='5466' pro_nom='ABVT1 CAPELAN' pro_critere='V12' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='5465' pro_nom='CUIDITÉS CRUDITÉS ET SAUCISSON SEC NON ASSAISONNÉS' pro_critere='X28' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='11'/>
		<z:row pro_numpro='5464' pro_nom='TARTELETTE AU FLAN' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5463' pro_nom='FILET DE CARRELET PANÉ CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='5462' pro_nom='COEUR DE PORC CRU (F)' pro_critere='B15' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='5461' pro_nom='MOUSSE DE POISSON' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='19' pro_t4='1'/>
		<z:row pro_numpro='5460' pro_nom='NOUGAT GLACÉ (F)' pro_critere='O15' pro_t1='0' pro_t2='10' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='5459' pro_nom='FROMAGE FRAIS DE CHEVRE AU LAIT PASTEURISÉ' pro_critere='O3' pro_t1='0' pro_t2='6'
			 pro_t3='6' pro_t4='2'/>
		<z:row pro_numpro='5458' pro_nom='JUS DE FRUITS PASTEURISÉ' pro_critere='A1' pro_t1='0' pro_t2='11' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5457' pro_nom='SAUCE COCKTAIL &#x22;MAISON&#x22;' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='5456' pro_nom='OIGNONS A LA GRECQUE' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='5455' pro_nom='EAU GÉLIFIÉE' pro_critere='A1' pro_t1='0' pro_t2='11' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5454' pro_nom='PULPE DE FRUIT FRAIS CONGELÉE' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='6'/>
		<z:row pro_numpro='5453' pro_nom='CREPE CHANTILLY S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='5451' pro_nom='BARQUETTE CREME AU BEURRE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5450' pro_nom='FILET DE SAUMON SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5449' pro_nom='CIVET DE CERF CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5448' pro_nom='BABA CREME MOUSSELINE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='5447' pro_nom='ASPIC LÉGUMES ET JAMBON CUIT' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5446' pro_nom='ROTI DE BICHE CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5445' pro_nom='SAUCISSE CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='5443' pro_nom='HAMBURGER DE VEAU CRU' pro_critere='B1' pro_t1='0' pro_t2='1' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='5442' pro_nom='FILET DE CABILLAUD FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5441' pro_nom='SEMOULE AU LAIT' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5440' pro_nom='FEUILLETÉ AU CHOCOLAT CUIT' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='5439' pro_nom='RIZ ET THON EN SALADE' pro_critere='X22' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='9'/>
		<z:row pro_numpro='5438' pro_nom='SALADE CUIDITÉS CRUDITÉS ET CHORIZO' pro_critere='X28' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='11'/>
		<z:row pro_numpro='5436' pro_nom='FOIE DE CANARD CRU' pro_critere='F6' pro_t1='0' pro_t2='2' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='5435' pro_nom='BABA AU RHUM SANS CREME' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='5434' pro_nom='COQUILLE DE FRUITS DE MER CUISINÉE AVEC FROMAGE' pro_critere='A5' pro_t1='0'
			 pro_t2='9' pro_t3='5' pro_t4='3'/>
		<z:row pro_numpro='5433' pro_nom='CREPE JAMBON FROMAGE CUITE' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='5431' pro_nom='PYRÉNÉES AU LAIT PASTEURISÉ' pro_critere='P5' pro_t1='0' pro_t2='6' pro_t3='9'
			 pro_t4='2'/>
		<z:row pro_numpro='5430' pro_nom='PATES NON ASSAISONNÉES' pro_critere='X4' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='8'/>
		<z:row pro_numpro='5429' pro_nom='RIZ ET FRUITS DE MER EN SALADE' pro_critere='X22' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='9'/>
		<z:row pro_numpro='5427' pro_nom='COMPOTE DE FRUITS FRAIS' pro_critere='X3' pro_t1='0' pro_t2='10' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='5426' pro_nom='RILLETTES DE POISSON' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='5425' pro_nom='RILLETTES DE SAUMON' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='5424' pro_nom='LÉGUMES CUITS A LA GRECQUE' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='5423' pro_nom='FEUILLETÉ AU POISSON CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='5'/>
		<z:row pro_numpro='5422' pro_nom='COTE DE PORC CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='5420' pro_nom='ROULADE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='12' pro_t4='2'/>
		<z:row pro_numpro='5419' pro_nom='FILET DE PERCHE SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5417' pro_nom='ANANAS FRAIS AU SIROP' pro_critere='X3' pro_t1='0' pro_t2='10' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='5416' pro_nom='SANDWICH AUX FRUITS DE MER' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='4'/>
		<z:row pro_numpro='5414' pro_nom='SANDWICH AU FROMAGE (LAIT PASTEURISÉ)' pro_critere='A7' pro_t1='0' pro_t2='8'
			 pro_t3='3' pro_t4='6'/>
		<z:row pro_numpro='5412' pro_nom='PAVÉ DE RUMSTECK DE BOEUF CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5411' pro_nom='MOUSSE DE VOLAILLE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5409' pro_nom='MOUSSE DE SAUMON' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='19' pro_t4='1'/>
		<z:row pro_numpro='5408' pro_nom='ROTI DE PINTADE FARCI CUIT' pro_critere='A2' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5407' pro_nom='ÉPAULE CUITE EN JULIENNE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='5406' pro_nom='POTAGE DÉSHYDRATÉ' pro_critere='A1' pro_t1='0' pro_t2='12' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='5405' pro_nom='GÉNOISE CREME ANGLAISE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='5404' pro_nom='TARTE A LA VIANDE CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='4'/>
		<z:row pro_numpro='5403' pro_nom='SANDWICH A LA VIANDE CUITE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5402' pro_nom='SAUMON FUMÉ' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='5401' pro_nom='MACÉDOINE ET OEUF DUR NON ASSAISONNÉS' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='15'/>
		<z:row pro_numpro='5398' pro_nom='GRAS DOUBLE CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='15' pro_t4='1'/>
		<z:row pro_numpro='5397' pro_nom='BLEU DE GEX AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='5396' pro_nom='BUCHETTE MOUSSE DE FOIE EN GELÉE' pro_critere='A5' pro_t1='0' pro_t2='8'
			 pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='5395' pro_nom='SAUCISSE DE CAMPAGNE CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='5394' pro_nom='TRANCHE DE CHEVAL CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='5'/>
		<z:row pro_numpro='5393' pro_nom='BEIGNET A LA CONFITURE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='5392' pro_nom='JOUE DE PORC CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='5391' pro_nom='TERRINE DE FOIE DE POISSON' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='19'
			 pro_t4='2'/>
		<z:row pro_numpro='5390' pro_nom='NOIX DE SAINT JACQUES CUISINÉES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='5389' pro_nom='CROQUE MONSIEUR PRÉCUIT' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='5387' pro_nom='SAUCE BÉARNAISE FROIDE &#x22;MAISON&#x22;' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='5385' pro_nom='VACHERIN AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='5382' pro_nom='COQUILLE DE POISSON CRUE SURGELÉE' pro_critere='H2' pro_t1='0' pro_t2='3'
			 pro_t3='12' pro_t4='1'/>
		<z:row pro_numpro='5381' pro_nom='CUIDITÉS ET SURIMI EN SALADE' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='6'/>
		<z:row pro_numpro='5380' pro_nom='MAIS NON ASSAISONNÉ' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='4'/>
		<z:row pro_numpro='5379' pro_nom='POLENTA CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='3'/>
		<z:row pro_numpro='5378' pro_nom='MIXÉ DE JAMBON CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='4'/>
		<z:row pro_numpro='5377' pro_nom='CREME MATURÉE FOUETTÉE AUX FINES HERBES &#x22;MAISON&#x22;' pro_critere='A5'
			 pro_t1='0' pro_t2='8' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='5376' pro_nom='MIXÉ DE LÉGUMES CRUS' pro_critere='X3' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='5375' pro_nom='GRATIN DE FRUITS DE MER CUISINÉ AVEC FROMAGE' pro_critere='A5' pro_t1='0'
			 pro_t2='9' pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='5374' pro_nom='CASSOLETTE DE SAINT JACQUES CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='5' pro_t4='3'/>
		<z:row pro_numpro='5373' pro_nom='SALADE VERTE ET OEUF DUR EN SALADE' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='15'/>
		<z:row pro_numpro='5372' pro_nom='ENDIVE ET FROMAGE EN SALADE' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='18'/>
		<z:row pro_numpro='5371' pro_nom='HARICOTS VERTS CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='2'/>
		<z:row pro_numpro='5370' pro_nom='RILLETTES DE PORC' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='5369' pro_nom='TARTE CREME D&#x27;AMANDE CUITE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='5368' pro_nom='SANDWICH AUX CREVETTES' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='4'/>
		<z:row pro_numpro='5367' pro_nom='CHAMPIGNONS CUITS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='5366' pro_nom='VIANDE DE LAPIN CRUE' pro_critere='F17' pro_t1='0' pro_t2='2' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5365' pro_nom='SOUPE DE POISSON' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='3'/>
		<z:row pro_numpro='5364' pro_nom='RILLETTES PUR PORC (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='9'
			 pro_t4='1'/>
		<z:row pro_numpro='5363' pro_nom='RILLETTES D&#x27;OIE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='9'
			 pro_t4='1'/>
		<z:row pro_numpro='5362' pro_nom='VIANDE DE BOEUF A HACHER CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5361' pro_nom='SANDWICH AU POISSON FUMÉ' pro_critere='A8' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='4'/>
		<z:row pro_numpro='5360' pro_nom='LENTILLES ET JAMBON EN SALADE' pro_critere='X22' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='11'/>
		<z:row pro_numpro='5359' pro_nom='CROQUE MONSIEUR A CUIRE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='5357' pro_nom='SAUCISSE DE MORTEAU CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='5356' pro_nom='CREME GLACÉE' pro_critere='O1' pro_t1='0' pro_t2='10' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='5355' pro_nom='CHOU FARCI CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='5354' pro_nom='TERRINE DE POISSON' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='19' pro_t4='1'/>
		<z:row pro_numpro='5353' pro_nom='SPÉCIALITÉ FROMAGERE AU LAIT PASTEURISÉ' pro_critere='P5' pro_t1='0' pro_t2='6'
			 pro_t3='11' pro_t4='1'/>
		<z:row pro_numpro='5352' pro_nom='ÉPAULE DE VEAU CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='5351' pro_nom='OEUF DUR' pro_critere='A1' pro_t1='0' pro_t2='7' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5350' pro_nom='SANG DE PORC A LA SAIGNÉE' pro_critere='B3' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='5349' pro_nom='ROGNONS DE PORC CRUS (F)' pro_critere='B15' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='5348' pro_nom='BAVETTE DE FLANCHET DE BOEUF CRUE' pro_critere='B2' pro_t1='0' pro_t2='1'
			 pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='5347' pro_nom='FARCE A TOMATE CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='5346' pro_nom='CHAIR A SAUCISSE CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='5345' pro_nom='MERGUEZ CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='5344' pro_nom='CHIPOLATA CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='5343' pro_nom='SAUCISSE A GRILLER CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='5342' pro_nom='SAUCISSE A FRIRE CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='5340' pro_nom='MILLE-FEUILLE CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='5338' pro_nom='GRATIN DE CRABE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='3'/>
		<z:row pro_numpro='5336' pro_nom='FEUILLETÉ DE POISSON PRÉCUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='5'/>
		<z:row pro_numpro='5334' pro_nom='CRUDITÉS ET OEUFS DURS MAYONNAISE' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='15'/>
		<z:row pro_numpro='5333' pro_nom='VIANDE DES GRISONS' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5332' pro_nom='SAUTÉ DE GIBIER CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5330' pro_nom='BOUDIN DE POISSON CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='2'/>
		<z:row pro_numpro='5329' pro_nom='VIANDE HACHÉE CRUE TRAITÉE EN SALAISON' pro_critere='F4' pro_t1='0' pro_t2='5'
			 pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='5328' pro_nom='CIVET DE MARCASSIN CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5327' pro_nom='BATONNET DE POISSON CUIT SURGELÉ' pro_critere='A1' pro_t1='0' pro_t2='3'
			 pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='5326' pro_nom='RIZ ET THON NON ASSAISONNÉS' pro_critere='X22' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='8'/>
		<z:row pro_numpro='5325' pro_nom='TARTELETTE A LA NOIX DE COCO' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='5324' pro_nom='ENTRECOTE PRÉCUITE' pro_critere='B2' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='4'/>
		<z:row pro_numpro='5323' pro_nom='RIZ ET CUIDITÉS NON ASSAISONNÉS' pro_critere='X4' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='8'/>
		<z:row pro_numpro='5322' pro_nom='RIZ ET CUIDITÉS EN SALADE' pro_critere='X4' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='9'/>
		<z:row pro_numpro='5321' pro_nom='BAECKHOFFE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='5320' pro_nom='ROTI DE DINDONNEAU SAUMURÉ CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5319' pro_nom='TETE DE VEAU EN SALADE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='5'/>
		<z:row pro_numpro='5318' pro_nom='ESCALOPE DE SAUMON SURGELÉE' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5317' pro_nom='BEAUFORT AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='5316' pro_nom='EMMENTAL RAPÉ AU LAIT PASTEURISÉ' pro_critere='P5' pro_t1='0' pro_t2='6'
			 pro_t3='10' pro_t4='2'/>
		<z:row pro_numpro='5315' pro_nom='COMTÉ AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='5314' pro_nom='EMMENTAL AU LAIT PASTEURISÉ' pro_critere='P5' pro_t1='0' pro_t2='6' pro_t3='10'
			 pro_t4='2'/>
		<z:row pro_numpro='5313' pro_nom='TOMME DE SAVOIE AU LAIT PASTEURISÉ' pro_critere='P5' pro_t1='0' pro_t2='6'
			 pro_t3='9' pro_t4='2'/>
		<z:row pro_numpro='5312' pro_nom='SAINT NECTAIRE AU LAIT PASTEURISÉ' pro_critere='P5' pro_t1='0' pro_t2='6'
			 pro_t3='9' pro_t4='2'/>
		<z:row pro_numpro='5310' pro_nom='TOMME DE SAVOIE AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='9'
			 pro_t4='1'/>
		<z:row pro_numpro='5309' pro_nom='SAINT NECTAIRE AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='9'
			 pro_t4='1'/>
		<z:row pro_numpro='5307' pro_nom='REBLOCHON AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='5306' pro_nom='BLEU AU LAIT PASTEURISÉ' pro_critere='P8' pro_t1='0' pro_t2='6' pro_t3='8'
			 pro_t4='2'/>
		<z:row pro_numpro='5305' pro_nom='BLEU AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='5304' pro_nom='ROQUEFORT AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='5303' pro_nom='MUNSTER AU LAIT PASTEURISÉ' pro_critere='O7' pro_t1='0' pro_t2='6' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='5302' pro_nom='BRIE AU LAIT PASTEURISÉ' pro_critere='O7' pro_t1='0' pro_t2='6' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='5301' pro_nom='MUNSTER AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='5300' pro_nom='BRIE AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='5299' pro_nom='BRIE DE MEAUX AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='5298' pro_nom='CAMEMBERT AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='5297' pro_nom='CAROTTES CUITES ASSAISONNÉES' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='5296' pro_nom='POITRINE DE DINDE SAUMURÉE CUITE (D)' pro_critere='A5' pro_t1='0' pro_t2='5'
			 pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='5295' pro_nom='GATEAU A LA MOUSSE AUX FRUITS' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5294' pro_nom='POITRINE ROULÉE SALÉE CRUE' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='5293' pro_nom='CUISSE DE PINTADE ROTIE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5292' pro_nom='SALADE CUIDITÉS CRUDITÉS ET FRUITS DE MER' pro_critere='X24' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='6'/>
		<z:row pro_numpro='5291' pro_nom='CERVELAS EN SALADE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='5'/>
		<z:row pro_numpro='5290' pro_nom='PATES ET KAMABOKO EN SALADE' pro_critere='X22' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='4'/>
		<z:row pro_numpro='5288' pro_nom='RIZ ET CRUDITÉS EN SALADE' pro_critere='X4' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='4'/>
		<z:row pro_numpro='5287' pro_nom='RIZ ET CHARCUTERIE CUITE EN SALADE' pro_critere='X22' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='4'/>
		<z:row pro_numpro='5286' pro_nom='SANDWICH JAMBON SEC' pro_critere='F3' pro_t1='0' pro_t2='8' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='5284' pro_nom='MÉDAILLON DE POISSON CUIT EN GELÉE' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='5283' pro_nom='COLLIER DE VEAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='5282' pro_nom='ABVT1 HARENG' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='5281' pro_nom='ABVT1 MULET' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='5280' pro_nom='ABVT1 ROUGET-BARBET' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='5279' pro_nom='ABVT1 RASCASSE' pro_critere='V10' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='5278' pro_nom='ABVT1 SOLE' pro_critere='V11' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='5277' pro_nom='ABVT1 LIMANDE SOLE' pro_critere='V11' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='5275' pro_nom='ABVT1 GRONDIN' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='5274' pro_nom='ABVT1 TRUITE' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='5273' pro_nom='ABVT1 SARDINE' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='5272' pro_nom='ABVT1 MERLAN' pro_critere='V12' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='5271' pro_nom='ABVT1 LIMANDE' pro_critere='V11' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='5270' pro_nom='ABVT2 MAQUEREAU' pro_critere='V14' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='5269' pro_nom='ABVT2 DORADE SÉBASTE' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='5268' pro_nom='ABVT1 DORADE' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='5267' pro_nom='ABVT1 CARRELET' pro_critere='V11' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='5266' pro_nom='ABVT1 FILET DE COLIN' pro_critere='V12' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='5265' pro_nom='ABVT1 TRANCHE DE THON' pro_critere='V14' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='5264' pro_nom='ABVT3 TRANCHE DE TAUPE DE MER' pro_critere='V15' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='3'/>
		<z:row pro_numpro='5261' pro_nom='ABVT1 TRANCHE DE SAUMON' pro_critere='V14' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='5260' pro_nom='ABVT1 TRANCHE DE MÉROU' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='5259' pro_nom='ABVT2 TRANCHE DE LIEU NOIR' pro_critere='V12' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='5258' pro_nom='ABVT1 TRANCHE DE CONGRE' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='5257' pro_nom='ABVT1 TRANCHE DE COLIN' pro_critere='V12' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='5255' pro_nom='ABVT3 TRANCHE DE CHIEN DE MER' pro_critere='V15' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='3'/>
		<z:row pro_numpro='5254' pro_nom='ABVT1 TRANCHE DE CABILLAUD' pro_critere='V12' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='5253' pro_nom='ABVT4 ENCORNET' pro_critere='V4' pro_t1='0' pro_t2='3' pro_t3='6' pro_t4='2'/>
		<z:row pro_numpro='5252' pro_nom='ABVT4 BLANC D&#x27;ENCORNET' pro_critere='V4' pro_t1='0' pro_t2='3' pro_t3='6'
			 pro_t4='2'/>
		<z:row pro_numpro='5251' pro_nom='ABVT4 BLANC DE SEICHE' pro_critere='V4' pro_t1='0' pro_t2='3' pro_t3='6' pro_t4='2'/>
		<z:row pro_numpro='5250' pro_nom='ABVT1 JOUE DE LOTTE' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='5249' pro_nom='ABVT1 FILET DE TRUITE' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5248' pro_nom='ABVT1 FILET DE SOLE' pro_critere='V11' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='5247' pro_nom='ABVT1 FILET DE SARDINE' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5246' pro_nom='ABVT1 FILET DE SABRE' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='5245' pro_nom='ABVT1 FILET DE PLIE' pro_critere='V11' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='5244' pro_nom='ABVT1 FILET DE PERCHE' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5243' pro_nom='ABVT1 FILET DE MORUETTE' pro_critere='V12' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5242' pro_nom='ABVT1 FILET DE MERLU' pro_critere='V12' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='5241' pro_nom='ABVT1 FILET DE MERLAN' pro_critere='V12' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5240' pro_nom='ABVT2 FILET DE MAQUEREAU' pro_critere='V14' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5239' pro_nom='ABVT1 FILET DE LOUP' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='5238' pro_nom='ABVT1 FILET DE LINGUE' pro_critere='V12' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5237' pro_nom='ABVT2 FILET DE LIEU JAUNE' pro_critere='V12' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5235' pro_nom='ABVT1 FILET DE JULIENNE' pro_critere='V12' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5233' pro_nom='ABVT1 FILET DE GRENADIER' pro_critere='V12' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5232' pro_nom='ABVT1 FILET DE FLÉTAN' pro_critere='V14' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5231' pro_nom='ABVT1 FILET DE DORADE' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5229' pro_nom='ABVT1 FILET DE CARRELET' pro_critere='V11' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5228' pro_nom='ABVT1 FILET DE CABILLAUD' pro_critere='V12' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5227' pro_nom='ABVT1 FILET D&#x27;ÉGLEFIN' pro_critere='V12' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5226' pro_nom='RABLE DE LAPIN CRU' pro_critere='F17' pro_t1='0' pro_t2='2' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5225' pro_nom='DÉCOUPE DE LAPIN CRUE' pro_critere='F17' pro_t1='0' pro_t2='2' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='5224' pro_nom='CUISSE DE LAPIN CRUE' pro_critere='F17' pro_t1='0' pro_t2='2' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5223' pro_nom='SAUTÉ DE DINDONNEAU CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5222' pro_nom='PILON DE DINDE CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5221' pro_nom='MAGRET DE CANARD CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5220' pro_nom='HAUT DE CUISSE DE POULET CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5219' pro_nom='HAUT DE CUISSE DE DINDONNEAU CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5218' pro_nom='FILET DE VOLAILLE CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5217' pro_nom='FILET DE DINDE CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5216' pro_nom='FILET DE CANARD CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5215' pro_nom='ESCALOPE DE VOLAILLE CRUE' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5214' pro_nom='ESCALOPE DE POULET CRUE' pro_critere='F17' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5212' pro_nom='ESCALOPE DE DINDONNEAU CRUE' pro_critere='F17' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5211' pro_nom='ESCALOPE DE DINDE CRUE' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5210' pro_nom='DÉCOUPE DE VOLAILLE CRUE' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5208' pro_nom='CUISSE DE POULET CRUE' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5207' pro_nom='CUISSE DE PINTADE CRUE' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5205' pro_nom='CUISSE DE CANARD CRUE' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5204' pro_nom='BLANQUETTE DE DINDE CRUE' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5203' pro_nom='BLANC DE POULET CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5202' pro_nom='BLANC DE DINDONNEAU EN TRANCHE CRU' pro_critere='F1' pro_t1='0' pro_t2='2'
			 pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5201' pro_nom='STEAK TARTARE DE BOEUF CRU' pro_critere='B1' pro_t1='0' pro_t2='1' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5200' pro_nom='CHOUCROUTE CUITE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='22' pro_t4='3'/>
		<z:row pro_numpro='5198' pro_nom='FILET DE POISSON PANÉ CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='3'/>
		<z:row pro_numpro='5197' pro_nom='PAUPIETTE DE DINDE CUISINÉE' pro_critere='A2' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='5196' pro_nom='SAUCISSON DE LYON CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='5195' pro_nom='HOT MERGUEZ PRÉCUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='4'/>
		<z:row pro_numpro='5194' pro_nom='PIEDS ET PAQUETS D&#x27;AGNEAU CRUS' pro_critere='B2' pro_t1='0' pro_t2='1'
			 pro_t3='4' pro_t4='3'/>
		<z:row pro_numpro='5193' pro_nom='HAMBURGER DE POULET CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='4'/>
		<z:row pro_numpro='5192' pro_nom='MOULES CUITES EN SALADE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='13'/>
		<z:row pro_numpro='5191' pro_nom='ROTI DE POISSON FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5190' pro_nom='FILET DE TURBOT FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5189' pro_nom='FILET DE SOLE TROPICALE FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5188' pro_nom='FILET DE SARDINE FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5187' pro_nom='FILET DE RASCASSE FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5186' pro_nom='FILET DE PLIE FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5183' pro_nom='FILET DE PERCHE FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5182' pro_nom='FILET DE MORUETTE FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5181' pro_nom='FILET DE MERLU FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5180' pro_nom='FILET DE LOUP FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5179' pro_nom='FILET DE LINGUE FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5178' pro_nom='FILET DE LIMANDE FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5177' pro_nom='FILET DE LIEU NOIR FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5176' pro_nom='FILET DE LIEU JAUNE FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5175' pro_nom='FILET DE JULIENNE FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5174' pro_nom='FILET DE GRENADIER FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5173' pro_nom='FILET DE FLÉTAN FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5172' pro_nom='FILET DE DAURADE FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5171' pro_nom='FILET DE CARRELET FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5170' pro_nom='POISSON HACHÉ SURGELÉ' pro_critere='J5' pro_t1='0' pro_t2='3' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='5169' pro_nom='BISQUE DE CRUSTACÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='5168' pro_nom='JARRET DE PORC SAUMURÉ CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='5167' pro_nom='FOIE DE LOTTE FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='12' pro_t4='1'/>
		<z:row pro_numpro='5166' pro_nom='CRÉPINETTE CUITE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='5165' pro_nom='SAUCISSE A CUIRE ÉTUVÉE' pro_critere='F18' pro_t1='0' pro_t2='5' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='5164' pro_nom='BLANQUETTE D&#x27;AGNEAU CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='5163' pro_nom='FRAMBOISIER (D)' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='5162' pro_nom='CONFIT DE PORC (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='5161' pro_nom='RILLETTES DU MANS (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='5160' pro_nom='RILLETTES D&#x27;OIE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='9'
			 pro_t4='1'/>
		<z:row pro_numpro='5159' pro_nom='STEAK DE CALAMAR PRÉCUIT SURGELÉ' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='5' pro_t4='6'/>
		<z:row pro_numpro='5158' pro_nom='SEICHE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='5157' pro_nom='HARENG SALÉ' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='5155' pro_nom='SAUCISSE DE VOLAILLE CUITE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='5154' pro_nom='MOUSSELINE DE SAUMON' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='19' pro_t4='1'/>
		<z:row pro_numpro='5153' pro_nom='JAMBON CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5152' pro_nom='MOUSSE DE CANARD (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='11' pro_t4='1'/>
		<z:row pro_numpro='5151' pro_nom='BLANC DE POULET CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5150' pro_nom='FRICANDEAU (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='5149' pro_nom='ESCALOPE DE DINDE PANÉE PRÉCUITE' pro_critere='F10' pro_t1='0' pro_t2='9'
			 pro_t3='3' pro_t4='5'/>
		<z:row pro_numpro='5148' pro_nom='PLAT DE COTE DE PORC EN SALAISON CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5147' pro_nom='JARRET DE PORC SAUMURÉ CRU' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='5146' pro_nom='SAUCISSE DE TOULOUSE CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='5136' pro_nom='FILET DE SABRE FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5135' pro_nom='CONFIT DE FOIE DE PORC (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='9'
			 pro_t4='1'/>
		<z:row pro_numpro='5134' pro_nom='TRIPES MODE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='15' pro_t4='2'/>
		<z:row pro_numpro='5132' pro_nom='MARTHA CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='5130' pro_nom='MÉDAILLON DE MOUSSE DE SAUMON CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='5129' pro_nom='PATES ET CHORIZO EN SALADE' pro_critere='X26' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='9'/>
		<z:row pro_numpro='5128' pro_nom='JUS DE FRUIT FRAIS' pro_critere='X3' pro_t1='0' pro_t2='11' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='5127' pro_nom='CREME FOUETTÉE S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='5126' pro_nom='FROMAGE A PATE MOLLE DE BREBIS AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6'
			 pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='5125' pro_nom='CIVET DE BICHE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5124' pro_nom='GENDARME' pro_critere='G1' pro_t1='0' pro_t2='5' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='5123' pro_nom='POITRINE DE PORC FUMÉE CRUE' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5122' pro_nom='BEIGNET DE POULET PRÉCUIT' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='4'/>
		<z:row pro_numpro='5120' pro_nom='TERRINE DE FOIE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='11' pro_t4='1'/>
		<z:row pro_numpro='5119' pro_nom='GRENADIN DE VEAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='5118' pro_nom='QUEUE DE LOTTE SURGELÉE' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5116' pro_nom='TIRAMISU' pro_critere='P3' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='5115' pro_nom='SOJA CUIT NON ASSAISONNÉ' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='5114' pro_nom='CONFIT D&#x27;OIE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='5113' pro_nom='ANCHOIADE' pro_critere='A5' pro_t1='0' pro_t2='3' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='5112' pro_nom='FEUILLETÉ CREME CHANTILLY S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5111' pro_nom='COTE DE PORC AVEC FROMAGE CUISINÉE' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='5110' pro_nom='COEUR DE BOEUF CRU (D)' pro_critere='B16' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='5109' pro_nom='FILET DE COLIN/LIEU PANÉ SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3'
			 pro_t3='3' pro_t4='4'/>
		<z:row pro_numpro='5107' pro_nom='FILET DE CABILLAUD PANÉ SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3'
			 pro_t3='3' pro_t4='4'/>
		<z:row pro_numpro='5106' pro_nom='ROTI DE PORC SAUMURÉ CUIT (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='5105' pro_nom='BEIGNET DE LÉGUMES CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='9'/>
		<z:row pro_numpro='5104' pro_nom='BLANQUETTE DE VOLAILLE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5103' pro_nom='QUENELLE AU FROMAGE CUISINÉE' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='2'/>
		<z:row pro_numpro='5102' pro_nom='VIANDE HACHÉE DE PORC ET FROMAGE CRUE' pro_critere='Z6' pro_t1='0' pro_t2='1'
			 pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='5101' pro_nom='BROCHETTE DE BOEUF CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='5100' pro_nom='BLANQUETTE DE VEAU CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='5099' pro_nom='GRAISSE DE VOLAILLE' pro_critere='S2' pro_t1='0' pro_t2='12' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5098' pro_nom='RIZ ET CRUDITÉS NON ASSAISONNÉS' pro_critere='X4' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='8'/>
		<z:row pro_numpro='5097' pro_nom='AIGUILLETTE DE VOLAILLE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='5096' pro_nom='FRUITS DE MER CUITS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='5095' pro_nom='SALADE DE FRUITS 4G (F)' pro_critere='X1' pro_t1='0' pro_t2='4' pro_t3='1'
			 pro_t4='7'/>
		<z:row pro_numpro='5094' pro_nom='MOULES PRÉCUITES SURGELÉES' pro_critere='J3' pro_t1='0' pro_t2='3' pro_t3='5'
			 pro_t4='3'/>
		<z:row pro_numpro='5093' pro_nom='BLANC DE POULET CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5092' pro_nom='STEAK HACHÉ DE BOEUF AVEC FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5091' pro_nom='FROMAGE A PATE MOLLE DE CHEVRE AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6'
			 pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='5088' pro_nom='FROMAGE A PATE MOLLE DE CHEVRE AU LAIT PASTEURISÉ' pro_critere='O7' pro_t1='0'
			 pro_t2='6' pro_t3='7' pro_t4='2'/>
		<z:row pro_numpro='5087' pro_nom='CUISSE DE LAPIN CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5086' pro_nom='PIED DE PORC CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='14'
			 pro_t4='1'/>
		<z:row pro_numpro='5085' pro_nom='PATES ET CRUDITÉS NON ASSAISONNÉES' pro_critere='X4' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='8'/>
		<z:row pro_numpro='5084' pro_nom='PATES ET CRUDITÉS EN SALADE' pro_critere='X4' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='9'/>
		<z:row pro_numpro='5083' pro_nom='PATES ET CHARCUTERIE CUITE NON ASSAISONNÉES' pro_critere='X22' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='8'/>
		<z:row pro_numpro='5082' pro_nom='PATES ET CHARCUTERIE CUITE EN SALADE' pro_critere='X22' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='9'/>
		<z:row pro_numpro='5081' pro_nom='FROMAGE A PATE MOLLE DE VACHE AU LAIT PASTEURISÉ' pro_critere='O7' pro_t1='0'
			 pro_t2='6' pro_t3='7' pro_t4='2'/>
		<z:row pro_numpro='5080' pro_nom='FROMAGE A PATE MOLLE DE BREBIS AU LAIT PASTEURISÉ' pro_critere='O7' pro_t1='0'
			 pro_t2='6' pro_t3='7' pro_t4='2'/>
		<z:row pro_numpro='5079' pro_nom='BEIGNET AU SUCRE CUIT' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='5078' pro_nom='CREME CHANTILLY (D)' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='5077' pro_nom='SARDINES A L&#x27;HUILE' pro_critere='A1' pro_t1='0' pro_t2='3' pro_t3='12'
			 pro_t4='1'/>
		<z:row pro_numpro='5076' pro_nom='SAUMON POCHÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='5075' pro_nom='ROULEAU D&#x27;OEUF DUR RECONSTITUÉ' pro_critere='A1' pro_t1='0' pro_t2='7'
			 pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5074' pro_nom='GATEAU A LA MOUSSE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='4'/>
		<z:row pro_numpro='5073' pro_nom='TARTELETTE CREME CHANTILLY M' pro_critere='P3' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='3'/>
		<z:row pro_numpro='5072' pro_nom='GÉNOISE CREME FOUETTÉE S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5071' pro_nom='FOIES VOLAILLE TRAITÉS SALAISON CUITS (D)' pro_critere='A5' pro_t1='0' pro_t2='5'
			 pro_t3='22' pro_t4='1'/>
		<z:row pro_numpro='5070' pro_nom='TERRINE DE VIANDE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='5069' pro_nom='SAUCISSE BLANCHE CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='5068' pro_nom='FEUILLETE A LA CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='5067' pro_nom='CUISSOT DE CERF CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5066' pro_nom='CROUSTADE DE FRUITS DE MER CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='5'/>
		<z:row pro_numpro='5065' pro_nom='FILET DE COLIN/LIEU SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5064' pro_nom='PIED DE PORC SAUMURÉ CUIT EN GELÉE (F)' pro_critere='A1' pro_t1='0' pro_t2='5'
			 pro_t3='14' pro_t4='1'/>
		<z:row pro_numpro='5063' pro_nom='TERRINE DE RIS DE VEAU (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='5062' pro_nom='CAILLE FARCIE CUITE' pro_critere='A2' pro_t1='0' pro_t2='9' pro_t3='4' pro_t4='3'/>
		<z:row pro_numpro='5061' pro_nom='TRAVERS DE PORC CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='5060' pro_nom='BOISSON LACTÉE AU CHOCOLAT' pro_critere='O9' pro_t1='0' pro_t2='11' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='5059' pro_nom='AIGUILLETTE RUMSTEACK DE BOEUF CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='5058' pro_nom='LARDONS FUMÉS PRÉCUITS' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5056' pro_nom='RUMSTECK DE BOEUF CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='5055' pro_nom='SAUCISSE A L&#x27;AIL (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='5054' pro_nom='CREME BAVAROISE S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='5053' pro_nom='NOIX DE PÉTONCLE CUISINÉES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='5052' pro_nom='POULET CRU DÉCOUPÉ' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5051' pro_nom='ANGUILLE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='5050' pro_nom='GÉNOISE CHOCOLAT' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='5049' pro_nom='FLAN DE POISSON CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='5048' pro_nom='RAVIOLES FRAICHES' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='5047' pro_nom='BEIGNET DE CALAMARS PRÉCUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='5'/>
		<z:row pro_numpro='5046' pro_nom='FRUITS A LA CREME FOUETTÉE S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5045' pro_nom='BEIGNET DE POISSON PRÉCUIT SURGELÉ' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='5' pro_t4='6'/>
		<z:row pro_numpro='5044' pro_nom='HAMBURGER PRÉCUIT' pro_critere='B1' pro_t1='0' pro_t2='9' pro_t3='4' pro_t4='3'/>
		<z:row pro_numpro='5043' pro_nom='POIREAUX CRUS ASSAISONNÉS' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='5042' pro_nom='PRÉPARATION HACHÉE DE VEAU PANÉE CRUE' pro_critere='B1' pro_t1='0' pro_t2='1'
			 pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='5041' pro_nom='PRÉPARATION HACHÉE DE PORC PANÉE CRUE' pro_critere='B1' pro_t1='0' pro_t2='1'
			 pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='5040' pro_nom='ESCALOPE DE DINDONNEAU CORDON BLEU CRUE' pro_critere='F10' pro_t1='0' pro_t2='2'
			 pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5039' pro_nom='FRAISE DE VEAU CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='5038' pro_nom='SANDWICH AU SALAMI' pro_critere='G1' pro_t1='0' pro_t2='8' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='5037' pro_nom='LARDONS FUMÉS CRUS' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='5035' pro_nom='CREVETTES CUITES DÉCORTIQUÉES (D)' pro_critere='I3' pro_t1='0' pro_t2='3'
			 pro_t3='7' pro_t4='4'/>
		<z:row pro_numpro='5032' pro_nom='AILE DE RAIE SURGELÉE' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5031' pro_nom='RILLONS (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='5030' pro_nom='MOKA CREME AU BEURRE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5029' pro_nom='CREVETTES ROSES DÉCORTIQUÉES SAUMURÉES' pro_critere='I3' pro_t1='0' pro_t2='3'
			 pro_t3='7' pro_t4='4'/>
		<z:row pro_numpro='5028' pro_nom='ESCALOPE DE PORC CORDON BLEU CRUE' pro_critere='F10' pro_t1='0' pro_t2='1'
			 pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='5027' pro_nom='MUSEAU DE PORC EN GELÉE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='14'
			 pro_t4='1'/>
		<z:row pro_numpro='5026' pro_nom='VIANDE HACHÉE DE VOLAILLE PANÉE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='4' pro_t4='3'/>
		<z:row pro_numpro='5025' pro_nom='FEUILLETÉ JAMBON FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='5024' pro_nom='CHOU CREME FOUETTÉE S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5023' pro_nom='BOUDIN DE LANGUE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='16' pro_t4='1'/>
		<z:row pro_numpro='5022' pro_nom='FILET DE POISSON PRÉCUIT SURGELÉ' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='5' pro_t4='6'/>
		<z:row pro_numpro='5021' pro_nom='CANNELLONIS CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='4'/>
		<z:row pro_numpro='5020' pro_nom='TERRINE AU CHOCOLAT' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='5019' pro_nom='COPPA' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='5018' pro_nom='FROMAGE BLANC FAISSELLE AU LAIT CRU (D)' pro_critere='P4' pro_t1='0' pro_t2='6'
			 pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='5017' pro_nom='SAINT HONORÉ (D)' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='5016' pro_nom='BRASÉRADE DE BOEUF CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='5015' pro_nom='LÉGUMES DÉSHYDRATÉS' pro_critere='U3' pro_t1='0' pro_t2='4' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='5014' pro_nom='SAUCISSE DE TOULOUSE PRÉCUITE' pro_critere='F4' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='7'/>
		<z:row pro_numpro='5013' pro_nom='TARTE AUX LÉGUMES PRÉCUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='8'/>
		<z:row pro_numpro='5012' pro_nom='GATEAU AU YAOURT' pro_critere='Z5' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='5011' pro_nom='PAUPIETTE DE LAPIN CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='5010' pro_nom='FILET DE CANARD CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='5009' pro_nom='VIANDE HACHÉE DE VOLAILLE AVEC FROMAGE CUITE' pro_critere='Z5' pro_t1='0'
			 pro_t2='9' pro_t3='4' pro_t4='3'/>
		<z:row pro_numpro='5008' pro_nom='FROMAGE FONDU' pro_critere='A1' pro_t1='0' pro_t2='6' pro_t3='11' pro_t4='1'/>
		<z:row pro_numpro='5007' pro_nom='PATES AU FROMAGE EN GRATIN' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='3'/>
		<z:row pro_numpro='5006' pro_nom='MIXÉ DE FRUITS FRAIS' pro_critere='X3' pro_t1='0' pro_t2='10' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='5005' pro_nom='ENDIVE AU JAMBON PRÉCUITE' pro_critere='A5' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='3'/>
		<z:row pro_numpro='5004' pro_nom='VIANDE HACHÉE DE PORC CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='5003' pro_nom='TOURTE CRUE AU FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='5002' pro_nom='PAUPIETTE DE VEAU PRÉCUITE' pro_critere='F10' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='7'/>
		<z:row pro_numpro='4999' pro_nom='COURGETTE FARCIE PRÉCUITE' pro_critere='F4' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='7'/>
		<z:row pro_numpro='4998' pro_nom='LIÉGEOIS (D)' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='4997' pro_nom='FLAN DE LÉGUMES CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='4996' pro_nom='TRANCHE DE POISSON RECONSTITUÉE SURGELÉE' pro_critere='H2' pro_t1='0' pro_t2='3'
			 pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='4995' pro_nom='FILET DE HARENG SAUR' pro_critere='M2' pro_t1='0' pro_t2='3' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='4994' pro_nom='CHOU FARCI PRÉCUIT' pro_critere='F4' pro_t1='0' pro_t2='9' pro_t3='6' pro_t4='7'/>
		<z:row pro_numpro='4993' pro_nom='VIANDE HACHÉE DE BOEUF CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4992' pro_nom='RIZ CANTONNAIS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='3'/>
		<z:row pro_numpro='4991' pro_nom='BROCHETTE DE POISSON PANÉ SURGELÉE' pro_critere='H2' pro_t1='0' pro_t2='3'
			 pro_t3='3' pro_t4='4'/>
		<z:row pro_numpro='4990' pro_nom='CHOU FARCI CRU' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4989' pro_nom='BEIGNET DE VOLAILLE PRÉCUIT' pro_critere='F2' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='6'/>
		<z:row pro_numpro='4988' pro_nom='TARTE OIGNON ET JAMBON CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='8'/>
		<z:row pro_numpro='4987' pro_nom='TRANCHE DE MERLU SURGELÉE' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4986' pro_nom='CAFÉ AU LAIT' pro_critere='O9' pro_t1='0' pro_t2='11' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4985' pro_nom='LAIT CHAUD' pro_critere='O9' pro_t1='0' pro_t2='6' pro_t3='1' pro_t4='4'/>
		<z:row pro_numpro='4984' pro_nom='POMMES DE TERRE FARCIES PRÉCUITES' pro_critere='F4' pro_t1='0' pro_t2='9'
			 pro_t3='6' pro_t4='7'/>
		<z:row pro_numpro='4983' pro_nom='TOURTE CRUE A LA VIANDE CRUE' pro_critere='F4' pro_t1='0' pro_t2='8' pro_t3='6'
			 pro_t4='4'/>
		<z:row pro_numpro='4982' pro_nom='MOUSSE AU FROMAGE BLANC' pro_critere='P3' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='4981' pro_nom='BRANDADE DE POISSON CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='4980' pro_nom='FEUILLETÉ CRU AUX LÉGUMES CUITS' pro_critere='A5' pro_t1='0' pro_t2='8'
			 pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='4979' pro_nom='COQUILLE DE POISSON MAYONNAISE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='13'/>
		<z:row pro_numpro='4978' pro_nom='AGNEAU CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4977' pro_nom='AGNEAU CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='4976' pro_nom='TARTE AUX NOIX' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4975' pro_nom='BLANC DE DINDE TRAITÉ EN SALAISON CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4974' pro_nom='CHIPOLATA PRÉCUITE' pro_critere='F4' pro_t1='0' pro_t2='9' pro_t3='6' pro_t4='7'/>
		<z:row pro_numpro='4973' pro_nom='STEAK DE POISSON RECONSTITUÉ CUIT' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4972' pro_nom='CUIDITÉS VARIÉES ASSAISONNÉES' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4971' pro_nom='GATEAU BASQUE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4970' pro_nom='GÉSIERS DE VOLAILLE CONFITS (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='9'
			 pro_t4='1'/>
		<z:row pro_numpro='4969' pro_nom='FILET DE CANARD FUMÉ CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4968' pro_nom='FILET DE HARENG FUMÉ' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='4967' pro_nom='ÉMINCÉ DE BOEUF CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='4966' pro_nom='FROMAGE A PATE PRESSÉE NON CUITE AU LAIT CRU' pro_critere='P4' pro_t1='0'
			 pro_t2='6' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='4965' pro_nom='FROMAGE A PATE PRESSÉE NON CUITE LAIT PASTEURISÉ' pro_critere='P5' pro_t1='0'
			 pro_t2='6' pro_t3='9' pro_t4='2'/>
		<z:row pro_numpro='4964' pro_nom='ESCALOPE DE DINDONNEAU PRÉCUITE' pro_critere='F17' pro_t1='0' pro_t2='9'
			 pro_t3='3' pro_t4='5'/>
		<z:row pro_numpro='4963' pro_nom='PAUPIETTE DE DINDONNEAU PRÉCUITE' pro_critere='F2' pro_t1='0' pro_t2='9'
			 pro_t3='6' pro_t4='7'/>
		<z:row pro_numpro='4962' pro_nom='FROMAGE A PATE MOLLE DE VACHE AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6'
			 pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='4961' pro_nom='FAUX FILET DE BOEUF CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='4960' pro_nom='SAUCISSE DE MONTBÉLIARD CUITE (D)' pro_critere='A5' pro_t1='0' pro_t2='5'
			 pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='4959' pro_nom='DAVICROQ CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='4958' pro_nom='SALAMI' pro_critere='G1' pro_t1='0' pro_t2='5' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='4957' pro_nom='FILET MIGNON DE PORC CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4956' pro_nom='FROMAGE A PATE PERSILLÉE LAIT PASTEURISÉ' pro_critere='P8' pro_t1='0' pro_t2='6'
			 pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='4955' pro_nom='SALADE COMPOSÉE CUIDITÉS CRUDITÉS ET CHARCUTERIE CUITE' pro_critere='X24'
			 pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='11'/>
		<z:row pro_numpro='4954' pro_nom='TOURNEDOS DE BOEUF CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4953' pro_nom='FROMAGE A PATE PERSILLÉE AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6'
			 pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='4952' pro_nom='STEAK HACHÉ DE VEAU CRU' pro_critere='B1' pro_t1='0' pro_t2='1' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4951' pro_nom='LARDONS CRUS' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4950' pro_nom='GRUYERE RAPÉ AU LAIT PASTEURISÉ' pro_critere='P5' pro_t1='0' pro_t2='6'
			 pro_t3='10' pro_t4='2'/>
		<z:row pro_numpro='4949' pro_nom='FLAN AU FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='4948' pro_nom='GÉNOISE CREME AU BEURRE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4947' pro_nom='HACHIS PARMENTIER AVEC FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4946' pro_nom='CORDON BLEU DE PORC CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='4945' pro_nom='MÉLANGE CUIDITÉS CRUDITÉS ET POISSON NON ASSAISONNÉS' pro_critere='X24'
			 pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='13'/>
		<z:row pro_numpro='4944' pro_nom='FROMAGE A PATE PRESSÉE CUITE AU LAIT PASTEURISÉ' pro_critere='P5' pro_t1='0'
			 pro_t2='6' pro_t3='10' pro_t4='2'/>
		<z:row pro_numpro='4943' pro_nom='BOULETTES DE VIANDE TRAITÉES EN SALAISON CRUES' pro_critere='F4' pro_t1='0'
			 pro_t2='5' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4942' pro_nom='CREVETTES CUITES MAYONNAISE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='13'/>
		<z:row pro_numpro='4941' pro_nom='BROCHETTE DE POISSON CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='4940' pro_nom='PAUPIETTE DE SAUMON SURGELÉE' pro_critere='J5' pro_t1='0' pro_t2='3' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4939' pro_nom='BETTERAVES ROUGES CRUES RAPÉES ASSAISONNÉES' pro_critere='X6' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4938' pro_nom='CORNET DE JAMBON EN GELÉE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4937' pro_nom='CERVELAS AU FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='2'/>
		<z:row pro_numpro='4936' pro_nom='VOLAILLE CRUE PANÉE AU FROMAGE' pro_critere='F10' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4935' pro_nom='VIANDE HACHÉE DE VEAU ET FROMAGE CRUE' pro_critere='Z6' pro_t1='0' pro_t2='1'
			 pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='4934' pro_nom='TARTELETTE CRUE AU FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='4933' pro_nom='GRILLETTE DE VEAU PANÉE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4932' pro_nom='STICK DE VOLAILLE PANÉ CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='3'/>
		<z:row pro_numpro='4931' pro_nom='TARTELETTE CREME CHANTILLY (D)' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4930' pro_nom='HACHIS PARMENTIER CUIT AVEC FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='9'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4929' pro_nom='CONFIT DE CUISSE DE CANARD (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='9'
			 pro_t4='1'/>
		<z:row pro_numpro='4928' pro_nom='FRUITS DE MER CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='4927' pro_nom='CONFIT DE CANARD (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='4926' pro_nom='MÉLANGE CUIDITÉS CRUDITÉS ET FRUITS DE MER NON ASSAISONNÉS' pro_critere='X24'
			 pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='13'/>
		<z:row pro_numpro='4925' pro_nom='LANGUE DE PORC SAUMURÉE CUITE (D)' pro_critere='A5' pro_t1='0' pro_t2='5'
			 pro_t3='14' pro_t4='1'/>
		<z:row pro_numpro='4924' pro_nom='LÉGUMES CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='4923' pro_nom='DAVICROQ' pro_critere='F8' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='4922' pro_nom='PRÉPARATION HACHÉE DE VOLAILLE PANÉE CRUE' pro_critere='F2' pro_t1='0'
			 pro_t2='2' pro_t3='7' pro_t4='2'/>
		<z:row pro_numpro='4921' pro_nom='GÉSIERS DE VOLAILLE CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='4920' pro_nom='ENDIVE AU JAMBON CUITE AVEC FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='9'
			 pro_t3='6' pro_t4='3'/>
		<z:row pro_numpro='4919' pro_nom='ROTI DE PORC SAUMURÉ CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4918' pro_nom='CRUDITÉS ET CUIDITÉS ET VIANDE NON ASSAISONNÉS' pro_critere='X24' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='11'/>
		<z:row pro_numpro='4917' pro_nom='MÉLANGE CUIDITÉS CRUDITÉS ET CHARCUTERIE CUITE NON ASSAI.' pro_critere='X24'
			 pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='11'/>
		<z:row pro_numpro='4916' pro_nom='PORC CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='4915' pro_nom='PATÉ IMPÉRIAL CRU' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='6' pro_t4='6'/>
		<z:row pro_numpro='4914' pro_nom='TARTE AU CITRON' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='4913' pro_nom='ÉCHINE DE PORC SAUMURÉE CRUE' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='4912' pro_nom='OMELETTE AVEC CHARCUTERIE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='4911' pro_nom='MOUTON CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='4910' pro_nom='GATEAU A LA MOUSSE AU CHOCOLAT' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='4909' pro_nom='ROTI DE SANGLIER CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='4908' pro_nom='RISSOLETTE DE VEAU CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4907' pro_nom='CHARLOTTE (D)' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='4906' pro_nom='BLANQUETTE DE DINDE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='4905' pro_nom='TOURTE AU POISSON CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='3'/>
		<z:row pro_numpro='4904' pro_nom='CREME DE MARRONS' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='8' pro_t4='3'/>
		<z:row pro_numpro='4903' pro_nom='TARTE AU FROMAGE BLANC' pro_critere='Z5' pro_t1='0' pro_t2='10' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4902' pro_nom='TRIPES CUITES TRAITÉES EN SALAISON (D)' pro_critere='A5' pro_t1='0' pro_t2='5'
			 pro_t3='15' pro_t4='1'/>
		<z:row pro_numpro='4901' pro_nom='SAUCISSE AU FROMAGE CUITE' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='2'/>
		<z:row pro_numpro='4900' pro_nom='SAUCISSE A PATE FINE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='4899' pro_nom='OPERA CREME AU BEURRE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4898' pro_nom='FOIE GRAS D&#x27;OIE CRU' pro_critere='G2' pro_t1='0' pro_t2='2' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='4897' pro_nom='CARRÉ DE PORC FUMÉ CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4896' pro_nom='CHOU FLEUR CRU MAYONNAISE' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='4895' pro_nom='ROGNONS D&#x27;AGNEAU CRUS (D)' pro_critere='B16' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='3'/>
		<z:row pro_numpro='4894' pro_nom='GATEAU A LA NOIX DE COCO' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4893' pro_nom='PALETTE DE PORC SAUMURÉE CRUE' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='4892' pro_nom='FROMAGE FRAIS PASTEURISÉ (D)' pro_critere='O3' pro_t1='0' pro_t2='6' pro_t3='6'
			 pro_t4='2'/>
		<z:row pro_numpro='4891' pro_nom='FROMAGE BLANC FAISSELLE AU LAIT PASTEURISÉ (D)' pro_critere='O3' pro_t1='0'
			 pro_t2='6' pro_t3='6' pro_t4='2'/>
		<z:row pro_numpro='4890' pro_nom='FROMAGE BLANC LISSE AU LAIT PASTEURISÉ (D)' pro_critere='O3' pro_t1='0' pro_t2='6'
			 pro_t3='6' pro_t4='2'/>
		<z:row pro_numpro='4889' pro_nom='RILLAUDS (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='4888' pro_nom='POIREAUX' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4887' pro_nom='OIGNONS TRANCHES' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='4886' pro_nom='FENOUIL CRU' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='2' pro_t4='5'/>
		<z:row pro_numpro='4885' pro_nom='COTE DE PORC CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='4884' pro_nom='CAROTTES ENTIERES ÉPLUCHÉES 4G (F)' pro_critere='X1' pro_t1='0' pro_t2='4'
			 pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='4883' pro_nom='CAPPELLETIS FRAIS' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='4882' pro_nom='CAPPELLETIS CUITS A L&#x27;EAU' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='4'/>
		<z:row pro_numpro='4881' pro_nom='BULOTS' pro_critere='K1' pro_t1='0' pro_t2='3' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4880' pro_nom='POISSON HACHÉ FRAIS' pro_critere='J2' pro_t1='0' pro_t2='3' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4879' pro_nom='AIGUILLETTE DE RUMSTECK CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4878' pro_nom='CÉLERI RAPÉ NON ASSAISONNÉ' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='3'/>
		<z:row pro_numpro='4877' pro_nom='HOT DOG CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='4'/>
		<z:row pro_numpro='4876' pro_nom='MORUE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4875' pro_nom='BROCOLIS CUITS NON ASSAISONNÉS' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='4874' pro_nom='TOMATES MAYONNAISE' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4873' pro_nom='OEUF DUR ET TOMATE NON ASSAISONNÉS' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='15'/>
		<z:row pro_numpro='4872' pro_nom='SAUCISSE AU CHOU CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='4871' pro_nom='RILLETTES A L&#x27;OIE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='9'
			 pro_t4='1'/>
		<z:row pro_numpro='4870' pro_nom='PANCETTA' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='4869' pro_nom='MOUSSE INSTANTANÉE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='4'/>
		<z:row pro_numpro='4868' pro_nom='LANGOUSTE ENTIERE CUITE SURGELÉE' pro_critere='I2' pro_t1='0' pro_t2='3'
			 pro_t3='7' pro_t4='3'/>
		<z:row pro_numpro='4867' pro_nom='VIANDE HACHÉE DE PORC PANÉE CRUE' pro_critere='B1' pro_t1='0' pro_t2='1'
			 pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='4866' pro_nom='FLAN INSTANTANÉ' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4865' pro_nom='FLAGEOLETS SURGELÉS' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='4864' pro_nom='ÉPAULE DE VEAU CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4863' pro_nom='ÉPAULE DE PORC CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4862' pro_nom='ENDIVE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='4861' pro_nom='CONCOMBRE MAYONNAISE' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4860' pro_nom='COEUR DE VEAU CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='4859' pro_nom='COEUR DE FRISÉE' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4858' pro_nom='COEUR DE BOEUF CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='4857' pro_nom='CHILI CON CARNE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='4856' pro_nom='CAPPELLETIS CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='4'/>
		<z:row pro_numpro='4855' pro_nom='BROCOLIS CUITS ASSAISONNÉS' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4854' pro_nom='BROCHETTE DE VOLAILLE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='4853' pro_nom='BROCHETTE DE VIANDE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4852' pro_nom='BROCHETTE DE PORC CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4851' pro_nom='ÉCLAIR CREME AU BEURRE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4850' pro_nom='BLANC D&#x27;OEUF PASTEURISÉ' pro_critere='P2' pro_t1='0' pro_t2='7' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4849' pro_nom='TARTELETTE CREME CHANTILLY S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4848' pro_nom='VOL AU VENT CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='2'/>
		<z:row pro_numpro='4847' pro_nom='VIENNOISERIE CUITE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4846' pro_nom='VACHERIN GLACÉ' pro_critere='O1' pro_t1='0' pro_t2='10' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='4845' pro_nom='TULIPE A LA CREME CHANTILLY S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4844' pro_nom='TRUITE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4843' pro_nom='TRUITE FUMÉE' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='4842' pro_nom='TRIPES CUITES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='4841' pro_nom='TORTELLINIS CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='4'/>
		<z:row pro_numpro='4840' pro_nom='TOMATES ASSAISONNÉES' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4839' pro_nom='TIMBALE DE POISSON CUITE FROIDE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='4838' pro_nom='TETE DE VEAU CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='4837' pro_nom='TERRINE DE SAUMON' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='19' pro_t4='1'/>
		<z:row pro_numpro='4836' pro_nom='TERRINE DE PORC (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10' pro_t4='2'/>
		<z:row pro_numpro='4835' pro_nom='TERRINE DE POISSON CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='2'/>
		<z:row pro_numpro='4834' pro_nom='TERRINE DE FOIE DE CANARD (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='4833' pro_nom='TERRINE DE CAMPAGNE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='4832' pro_nom='TERRINE DE BRETAGNE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='4831' pro_nom='TERRINE AU POIVRE VERT (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='4830' pro_nom='TARTELETTE CREME CHANTILLY P' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='4829' pro_nom='TAJINE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='4828' pro_nom='POISSON POCHÉ FROID' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='4827' pro_nom='STEAK HACHÉ DE BOEUF CRU' pro_critere='B1' pro_t1='0' pro_t2='1' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4826' pro_nom='SAUTÉ DE BOEUF CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='4825' pro_nom='SAUCISSON CUIT EN CROUTE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='4'/>
		<z:row pro_numpro='4824' pro_nom='SAUCISSE DE FOIE DE PORC CUITE (D)' pro_critere='A5' pro_t1='0' pro_t2='5'
			 pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='4823' pro_nom='SANDWICH A LA VOLAILLE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4822' pro_nom='SANDWICH AUX CRUDITÉS' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='5'/>
		<z:row pro_numpro='4821' pro_nom='SALSIFIS SURGELÉS' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='4820' pro_nom='CRUDITÉS VARIÉES AU FROMAGE BLANC' pro_critere='X6' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4819' pro_nom='JAMBON CUIT EN SALADE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='11'/>
		<z:row pro_numpro='4818' pro_nom='ROUELLE DE PORC CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='4817' pro_nom='ROTI DE DINDE CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='4816' pro_nom='ROTI DE CANARD FARCI CUIT' pro_critere='A2' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4815' pro_nom='ROTI DE BOEUF CUIT FROID' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='9'
			 pro_t4='1'/>
		<z:row pro_numpro='4814' pro_nom='ROTI DE BOEUF CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4813' pro_nom='ROSETTE' pro_critere='G1' pro_t1='0' pro_t2='5' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='4812' pro_nom='ROGNONS DE BOEUF CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='4811' pro_nom='RIS DE VEAU CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='4810' pro_nom='RAVIOLIS CHINOIS CUITS' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='6'/>
		<z:row pro_numpro='4809' pro_nom='RATATOUILLE SURGELÉE' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2' pro_t4='5'/>
		<z:row pro_numpro='4808' pro_nom='RADIS NOIRS RAPÉS NON ASSAISONNÉS' pro_critere='X3' pro_t1='0' pro_t2='4'
			 pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='4807' pro_nom='RADIS ASSAISONNÉS' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4806' pro_nom='RADIS MAYONNAISE' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4805' pro_nom='QUICHE LORRAINE CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='8'/>
		<z:row pro_numpro='4804' pro_nom='QUEUE DE LANGOUSTE CUITE SURGELÉE' pro_critere='I2' pro_t1='0' pro_t2='3'
			 pro_t3='7' pro_t4='3'/>
		<z:row pro_numpro='4803' pro_nom='PURÉE DE POMME DE TERRE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='4802' pro_nom='PRINTANIERE DE LÉGUMES SURGELÉE' pro_critere='U2' pro_t1='0' pro_t2='4'
			 pro_t3='2' pro_t4='5'/>
		<z:row pro_numpro='4801' pro_nom='JARDINIERE DE LÉGUMES CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='4800' pro_nom='POULE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='4799' pro_nom='POT AU FEU DE BOEUF CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4798' pro_nom='POMMES DE TERRE FARCIES CUITES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4797' pro_nom='POMMES DE TERRE CUITES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='4796' pro_nom='POMMES DE TERRE PRÉCUITES SURGELÉES' pro_critere='A1' pro_t1='0' pro_t2='4'
			 pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='4795' pro_nom='POLENTA CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='5'/>
		<z:row pro_numpro='4794' pro_nom='POIVRONS TRANCHES' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='4793' pro_nom='PETITS POIS SURGELÉS' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='4792' pro_nom='PETIT SALÉ CRU' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4791' pro_nom='PERSIL FRAIS' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='1' pro_t4='4'/>
		<z:row pro_numpro='4790' pro_nom='PAVÉ DE BOEUF CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4789' pro_nom='PATES CUITES A L&#x27;EAU' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='5'/>
		<z:row pro_numpro='4788' pro_nom='PATÉ DE VOLAILLE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='4787' pro_nom='PATÉ DE CHEVREUIL (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='2'/>
		<z:row pro_numpro='4786' pro_nom='PATÉ ARDENNAIS (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='4785' pro_nom='PALERON CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='4784' pro_nom='PAIN PERDU' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4783' pro_nom='OEUFS DE CABILLAUD FUMÉS' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='4782' pro_nom='PATES EN SALADE' pro_critere='X4' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='9'/>
		<z:row pro_numpro='4781' pro_nom='ALOYAU DE BOEUF CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='4780' pro_nom='NEM CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='6'/>
		<z:row pro_numpro='4779' pro_nom='NAVARIN DE VEAU CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4778' pro_nom='NAVARIN D&#x27;AGNEAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='4777' pro_nom='MOUSSELINE DE SAUMON CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='4776' pro_nom='MOUSSE DE CANARD (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='11' pro_t4='1'/>
		<z:row pro_numpro='4775' pro_nom='TRANCHE DE MERLU FRAICHE' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4774' pro_nom='MERGUEZ DE VOLAILLE CRUE' pro_critere='F2' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='4773' pro_nom='MAQUEREAU ASSAISONNÉ' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='14'/>
		<z:row pro_numpro='4772' pro_nom='MAGRET D&#x27;OIE FUMÉ CRU' pro_critere='F7' pro_t1='0' pro_t2='5' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4771' pro_nom='MACREUSE BOUILLIE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='4770' pro_nom='MACÉDOINE DE LÉGUMES SURGELÉE' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='5'/>
		<z:row pro_numpro='4769' pro_nom='MACÉDOINE DE LÉGUMES CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='4768' pro_nom='MACÉDOINE DE LÉGUMES ASSAISONNÉE' pro_critere='X6' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='4767' pro_nom='LONGE DE PORC CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4766' pro_nom='LANGUE DE VEAU CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='4765' pro_nom='LANGUE DE PORC EN SALADE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='11'/>
		<z:row pro_numpro='4764' pro_nom='LANGUE DE BOEUF CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='4763' pro_nom='LANGOUSTINE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='4762' pro_nom='JUS DE FRUITS DE CONSERVE' pro_critere='A1' pro_t1='0' pro_t2='11' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4761' pro_nom='JOUE DE BOEUF CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4760' pro_nom='JARRET DE PORC BOUILLI' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4759' pro_nom='JARRET DE BOEUF BOUILLI' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4758' pro_nom='JARDINIERE DE LÉGUMES CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='2'/>
		<z:row pro_numpro='4757' pro_nom='JAMBON DE DINDE CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4756' pro_nom='HURE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6' pro_t4='2'/>
		<z:row pro_numpro='4755' pro_nom='HARICOTS VERTS SURGELÉS' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4754' pro_nom='GITE DE BOEUF CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='4753' pro_nom='GIGOT DE MOUTON CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='4'/>
		<z:row pro_numpro='4752' pro_nom='GIGOT D&#x27;AGNEAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='4751' pro_nom='GIGOLETTE DE VOLAILLE ROTIE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4750' pro_nom='GÉSIERS DE VOLAILLES CONFITS CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='6' pro_t4='2'/>
		<z:row pro_numpro='4749' pro_nom='GÉNOISE CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='4748' pro_nom='GÉNOISE CREME PATISSIERE ET FRUITS FRAIS' pro_critere='P1' pro_t1='0' pro_t2='10'
			 pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='4747' pro_nom='GÉNOISE CREME CHANTILLY (D)' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4746' pro_nom='GAMBAS CRUES' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='4745' pro_nom='GALANTINE DE CANARD (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='12'
			 pro_t4='2'/>
		<z:row pro_numpro='4744' pro_nom='GALANTINE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='12' pro_t4='1'/>
		<z:row pro_numpro='4743' pro_nom='FRUITS SÉCHÉS' pro_critere='A1' pro_t1='0' pro_t2='4' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='4742' pro_nom='SALADE FRISÉE' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4741' pro_nom='FRAISES FRAICHES' pro_critere='X3' pro_t1='0' pro_t2='10' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='4740' pro_nom='FORET NOIRE CREME CHANTILLY S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4739' pro_nom='FORET NOIRE (D)' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='4738' pro_nom='FILET DE VEAU CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4737' pro_nom='FILET DE VEAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='4736' pro_nom='FILET DE PORC CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4735' pro_nom='FILET DE LOTTE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='4734' pro_nom='FILET DE LIMANDE SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4733' pro_nom='FILET DE LIEU NOIR SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4732' pro_nom='FILET DE HARENG DOUX' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='4731' pro_nom='FILET DE HADDOCK CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='4730' pro_nom='FILET DE FLÉTAN SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4729' pro_nom='FILET DE DAURADE SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4728' pro_nom='FILET D&#x27;ANCHOIS' pro_critere='M6' pro_t1='0' pro_t2='3' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='4727' pro_nom='FENOUIL MAYONNAISE' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4726' pro_nom='ESCALOPE DE VOLAILLE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4725' pro_nom='ESCALOPE DE SAUMON CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='4724' pro_nom='ESCALOPE DE POULET CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4723' pro_nom='ESCALOPE DE DINDONNEAU CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4722' pro_nom='ÉPINARDS HACHÉS SURGELÉS' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4721' pro_nom='ÉPINARDS EN BRANCHE SURGELÉS' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4720' pro_nom='ÉCHINE DE PORC CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4719' pro_nom='DARNE DE THON CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='4718' pro_nom='CUIDITÉS VARIÉES NON ASSAISONNÉES' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='4717' pro_nom='CREVETTES ROSES CUITES' pro_critere='A1' pro_t1='0' pro_t2='3' pro_t3='7'
			 pro_t4='3'/>
		<z:row pro_numpro='4716' pro_nom='CRESSON' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4715' pro_nom='CREPES CUISINÉES' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='9'/>
		<z:row pro_numpro='4714' pro_nom='CREME INSTANTANÉE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4713' pro_nom='CREME D&#x27;AMANDE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='4712' pro_nom='CRABE MAYONNAISE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='13'/>
		<z:row pro_numpro='4711' pro_nom='COURGETTE CRUE SURGELÉE' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4710' pro_nom='COTELETTE DE DINDONNEAU CRUE' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4709' pro_nom='COTE DE BOEUF CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4708' pro_nom='CORNET FEUILLETÉ CREME CHANTILLY S' pro_critere='P1' pro_t1='0' pro_t2='10'
			 pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='4707' pro_nom='CORNET CREME AU BEURRE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4706' pro_nom='SURIMI MAYONNAISE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='9'/>
		<z:row pro_numpro='4705' pro_nom='CONFITURE' pro_critere='A1' pro_t1='0' pro_t2='12' pro_t3='2' pro_t4='4'/>
		<z:row pro_numpro='4704' pro_nom='CONCOMBRE AU FROMAGE BLANC' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='4703' pro_nom='COEURS DE PALMIER NON ASSAISONNÉS' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='4702' pro_nom='CHOUX DE BRUXELLES SURGELÉS' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4701' pro_nom='CHOU FLEUR SURGELÉ' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='4700' pro_nom='CHOU CREME CHANTILLY (D)' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4699' pro_nom='CHOU BLANC RAPÉ MAYONNAISE' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='4698' pro_nom='CHAMPIGNONS CUITS MAYONNAISE' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4697' pro_nom='CHAMPIGNONS CRUS SURGELÉS' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4696' pro_nom='CHAMPIGNONS CRUS ASSAISONNÉS' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='4695' pro_nom='CERVELLE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='4694' pro_nom='CÉLERI RAPÉ 4G (F)' pro_critere='X1' pro_t1='0' pro_t2='4' pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='4693' pro_nom='AUBERGINES CUISINÉES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='4692' pro_nom='CASSOLETTE DE MOULES CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='4691' pro_nom='CARRÉ DE VEAU CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='4690' pro_nom='CARRÉ D&#x27;AGNEAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='4689' pro_nom='CARPACCIO DE BOEUF' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='4688' pro_nom='CAROTTES EN RONDELLES SURGELÉES' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4687' pro_nom='CALAMARS EN SALADE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='13'/>
		<z:row pro_numpro='4686' pro_nom='BULOTS CUITS' pro_critere='I2' pro_t1='0' pro_t2='3' pro_t3='7' pro_t4='3'/>
		<z:row pro_numpro='4685' pro_nom='BUCHETTE DE SAUMON CUIT EN GELÉE' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='4684' pro_nom='BUCHE CREME AU BEURRE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4683' pro_nom='BROCHETTE DE DINDONNEAU CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4682' pro_nom='BOULETTES DE VIANDE DE BOEUF CRUES' pro_critere='B1' pro_t1='0' pro_t2='1'
			 pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='4681' pro_nom='LÉGUMES BOUILLIS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='4680' pro_nom='ROTI DE BOEUF SAUMURÉ CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4679' pro_nom='BOEUF CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='4678' pro_nom='BLINIS CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='9'/>
		<z:row pro_numpro='4677' pro_nom='BLANC DE DINDE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='4676' pro_nom='BLANC D&#x27;ENCORNET CRU' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='4675' pro_nom='BETTERAVES ROUGES CRUES RAPÉES NON ASSAISONNÉES' pro_critere='X3' pro_t1='0'
			 pro_t2='4' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='4674' pro_nom='BEIGNET DE POULET CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='4'/>
		<z:row pro_numpro='4673' pro_nom='BEIGNET DE CERVELLE CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4672' pro_nom='BATONNET DE SURIMI' pro_critere='A1' pro_t1='0' pro_t2='3' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='4671' pro_nom='AVOCAT MAYONNAISE' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4670' pro_nom='AVOCAT NON ASSAISONNÉ' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='5'/>
		<z:row pro_numpro='4669' pro_nom='AUBERGINES CUITES ASSAISONNÉES' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4668' pro_nom='AUBERGINE FARCIE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4667' pro_nom='ASPIC BUCHE JAMBON CUIT' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4666' pro_nom='ARTICHAUTS CUITS ASSAISONNÉS' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4665' pro_nom='AILE DE RAIE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='4664' pro_nom='SAUTÉ DE DINDONNEAU CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='4663' pro_nom='LAIT EN POUDRE' pro_critere='N1' pro_t1='0' pro_t2='6' pro_t3='1' pro_t4='5'/>
		<z:row pro_numpro='4662' pro_nom='SAUCISSE VIENNOISE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='4661' pro_nom='SAUCE BOLOGNAISE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4660' pro_nom='MOULES PRÉCUITES' pro_critere='J3' pro_t1='0' pro_t2='3' pro_t3='5' pro_t4='3'/>
		<z:row pro_numpro='4659' pro_nom='YAOURT' pro_critere='O2' pro_t1='0' pro_t2='6' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='4658' pro_nom='VOLAILLE ROTIE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='4657' pro_nom='VIOLETS' pro_critere='K1' pro_t1='0' pro_t2='3' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4656' pro_nom='VIANDE HACHÉE DE VEAU CRUE' pro_critere='B1' pro_t1='0' pro_t2='1' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4655' pro_nom='VIANDE HACHÉE DE PORC CRUE' pro_critere='B1' pro_t1='0' pro_t2='1' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4654' pro_nom='VIANDE HACHÉE DE CHEVAL CRUE' pro_critere='B1' pro_t1='0' pro_t2='1' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4653' pro_nom='VIANDE HACHÉE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4652' pro_nom='VIANDE CUITE MIXÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4651' pro_nom='DÉCOUPE DE BOEUF CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4650' pro_nom='VERNIS' pro_critere='K1' pro_t1='0' pro_t2='3' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4649' pro_nom='VEAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='4648' pro_nom='TRUITE MEUNIERE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4647' pro_nom='TROPÉZIENNE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='4'/>
		<z:row pro_numpro='4646' pro_nom='TRIPES CUISINÉES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='4645' pro_nom='TRIPES A LA TOMATE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='15'
			 pro_t4='2'/>
		<z:row pro_numpro='4644' pro_nom='TRIPES A LA TOMATE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='15'
			 pro_t4='2'/>
		<z:row pro_numpro='4643' pro_nom='TRANCHE GRASSE DE BOEUF CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4642' pro_nom='TOURTE AU JAMBON ET FROMAGE CUITE' pro_critere='Z5' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='2'/>
		<z:row pro_numpro='4641' pro_nom='TOURTE AUX LÉGUMES CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='9'/>
		<z:row pro_numpro='4640' pro_nom='TOURTE AUX FRUITS DE MER CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='3'/>
		<z:row pro_numpro='4639' pro_nom='TOURTE CUITE AUX FRUITS' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4638' pro_nom='TOURTE AU FROMAGE CUITE' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='4637' pro_nom='TOURNEDOS DE BOEUF CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='4636' pro_nom='TOURNEDOS DE VOLAILLE CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4635' pro_nom='TORTELLINIS FRAIS' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='4634' pro_nom='TORTELLINIS AVEC FROMAGE CUISINÉS' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='8' pro_t4='4'/>
		<z:row pro_numpro='4633' pro_nom='TOMATES CUISINÉES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='4632' pro_nom='TOMATES TRANCHÉES' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='2' pro_t4='5'/>
		<z:row pro_numpro='4631' pro_nom='TOMATE FARCIE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4630' pro_nom='TIELLE CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='5'/>
		<z:row pro_numpro='4629' pro_nom='MACÉDOINE ET THON MAYONNAISE' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='13'/>
		<z:row pro_numpro='4628' pro_nom='TRANCHE DE THON FRAICHE' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4627' pro_nom='THON CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='4626' pro_nom='TÉTINE BLANCHIE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4625' pro_nom='TETE DE VEAU CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='4624' pro_nom='TETE ROULÉE CUITE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='14'
			 pro_t4='1'/>
		<z:row pro_numpro='4623' pro_nom='TETE ROULÉE CUITE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='14'
			 pro_t4='1'/>
		<z:row pro_numpro='4622' pro_nom='TETE PERSILLÉE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='14' pro_t4='1'/>
		<z:row pro_numpro='4621' pro_nom='TETE DE VEAU CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4620' pro_nom='TETE DE PORC CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='4619' pro_nom='TETE DE NEGRE CREME AU BEURRE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4618' pro_nom='TERRINE FORESTIERE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='4617' pro_nom='TERRINE DE VOLAILLE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='4616' pro_nom='TERRINE DE VOLAILLE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='4615' pro_nom='TERRINE DE SANGLIER (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='4614' pro_nom='TERRINE DE LIEVRE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='4613' pro_nom='TERRINE DE LIEVRE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='4612' pro_nom='TERRINE DE LÉGUMES (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='20'
			 pro_t4='1'/>
		<z:row pro_numpro='4611' pro_nom='TERRINE DE LÉGUMES (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='20'
			 pro_t4='1'/>
		<z:row pro_numpro='4610' pro_nom='TERRINE DE LAPIN (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='4609' pro_nom='TERRINE DE LAPIN (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='4608' pro_nom='TERRINE DE GIBIER (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='4607' pro_nom='TERRINE DE FOIE DE VOLAILLE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='4606' pro_nom='TERRINE DE FOIE DE VOLAILLE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='4605' pro_nom='TERRINE DE CHEVREUIL (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='4604' pro_nom='TERRINE DE CANARD (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='4603' pro_nom='TERRINE DE CANARD (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='4602' pro_nom='TERRINE AUX FRUITS DE MER' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='19'
			 pro_t4='1'/>
		<z:row pro_numpro='4601' pro_nom='TERRINE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='4600' pro_nom='TERRINE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='4599' pro_nom='TENDRON DE VEAU CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4598' pro_nom='TENDRON DE VEAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='4597' pro_nom='TELLINES' pro_critere='K1' pro_t1='0' pro_t2='3' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4596' pro_nom='TARTELETTE CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='4595' pro_nom='TARTELETTE CREME PATISSIERE AUX FRUITS FRAIS' pro_critere='P1' pro_t1='0'
			 pro_t2='10' pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='4594' pro_nom='TARTELETTE AUX POMMES' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4593' pro_nom='TARTELETTE AU CITRON' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='4592' pro_nom='TARTE AU POISSON CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='3'/>
		<z:row pro_numpro='4591' pro_nom='TARTE CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='4590' pro_nom='TARTE CREME PATISSIERE AUX FRUITS FRAIS' pro_critere='P1' pro_t1='0' pro_t2='10'
			 pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='4589' pro_nom='TARTE CREME CHANTILLY S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4588' pro_nom='TARTE CREME AU BEURRE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4587' pro_nom='TARTE AUX POMMES' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4586' pro_nom='TARTE AUX POIREAUX CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='8'/>
		<z:row pro_numpro='4585' pro_nom='TARTE AUX LÉGUMES CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='8'/>
		<z:row pro_numpro='4584' pro_nom='TARTE AUX CHAMPIGNONS CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='8'/>
		<z:row pro_numpro='4583' pro_nom='TARTE AUX FRUITS DE MER CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='3'/>
		<z:row pro_numpro='4582' pro_nom='TARTE AU FROMAGE CUITE' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='8'/>
		<z:row pro_numpro='4581' pro_nom='TARTE AU FLAN' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4580' pro_nom='QUICHE A LA VIANDE CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='8'/>
		<z:row pro_numpro='4579' pro_nom='TARTE A L&#x27;OIGNON CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='8'/>
		<z:row pro_numpro='4578' pro_nom='TAGLIATELLES FRAICHES' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4577' pro_nom='TABOULÉ AUX FRUITS DE MER' pro_critere='X22' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='9'/>
		<z:row pro_numpro='4576' pro_nom='TABOULÉ' pro_critere='X4' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='9'/>
		<z:row pro_numpro='4575' pro_nom='TABLIER DE SAPEUR CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='4574' pro_nom='SURIMI' pro_critere='A1' pro_t1='0' pro_t2='3' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='4573' pro_nom='SUPIONS CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='4572' pro_nom='SUCCES A LA GANACHE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='4571' pro_nom='STICK DE POISSON PANÉ SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='4'/>
		<z:row pro_numpro='4570' pro_nom='STICK DE POISSON PANÉ CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='3'/>
		<z:row pro_numpro='4569' pro_nom='STICK DE MERLU PANÉ CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='3'/>
		<z:row pro_numpro='4568' pro_nom='STEAK HACHÉ DE BOEUF PRÉCUIT' pro_critere='B1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='4567' pro_nom='STEAK HACHÉ DE PORC CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4566' pro_nom='STEAK HACHÉ DE BOEUF CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4565' pro_nom='STEAK DE VOLAILLE PANÉ CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4564' pro_nom='STEAK DE VOLAILLE CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4563' pro_nom='STEAK DE MERLU CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='4562' pro_nom='STEAK DE DINDONNEAU CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4561' pro_nom='STEAK DE DINDE CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='4560' pro_nom='STEAK DE CABILLAUD CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='4559' pro_nom='SPAGHETTIS CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='3'/>
		<z:row pro_numpro='4558' pro_nom='SPAGHETTIS BOLOGNAISE CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4557' pro_nom='SOUPE DE LÉGUMES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='4556' pro_nom='SOUFFLÉ AUX FRUITS' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4555' pro_nom='SOUFFLÉ DE POISSON CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='4554' pro_nom='SOUFFLÉ AU FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='4553' pro_nom='SEMOULE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='3'/>
		<z:row pro_numpro='4552' pro_nom='SELLE D&#x27;AGNEAU CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='4551' pro_nom='SCAROLE' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4550' pro_nom='SAUTÉ DE VOLAILLE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='4549' pro_nom='SAUTÉ DE VEAU CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4548' pro_nom='SAUTÉ DE VEAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='4547' pro_nom='SAUTÉ DE PORCELET CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4546' pro_nom='SAUTÉ DE PORC CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4545' pro_nom='SAUTÉ DE PORC CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='4544' pro_nom='SAUTÉ DE MOUTON CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4543' pro_nom='FOIES DE VOLAILLES CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='4542' pro_nom='SAUTÉ DE DINDE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='4541' pro_nom='SAUTÉ DE DINDE CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='4540' pro_nom='SAUTÉ DE CHEVREUIL CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='4539' pro_nom='SAUTÉ DE CANARD CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='4538' pro_nom='SAUTÉ DE BOEUF CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4537' pro_nom='SAUTÉ D&#x27;AGNEAU CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4536' pro_nom='SAUTÉ D&#x27;AGNEAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='4535' pro_nom='SAUMONETTE POCHÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4534' pro_nom='SAUMONETTE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='4533' pro_nom='SAUMON EN TRANCHE GRILLÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='4532' pro_nom='TRANCHE DE SAUMON FRAICHE' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4531' pro_nom='SAUMON CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='4530' pro_nom='SAUCISSON SEC' pro_critere='G1' pro_t1='0' pro_t2='5' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='4529' pro_nom='SAUCISSON DE JAMBON (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='4528' pro_nom='SAUCISSON CUIT (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='4527' pro_nom='SAUCISSON CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='4526' pro_nom='SAUCISSON CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='4525' pro_nom='SAUCISSON BRIOCHÉ (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='13'
			 pro_t4='2'/>
		<z:row pro_numpro='4524' pro_nom='SAUCISSON BRIOCHÉ (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='13'
			 pro_t4='2'/>
		<z:row pro_numpro='4523' pro_nom='SAUCISSON A L&#x27;AIL (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='4522' pro_nom='SAUCISSON A L&#x27;AIL (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='4521' pro_nom='SAUCISSE DE STRASBOURG EN SALADE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='11'/>
		<z:row pro_numpro='4520' pro_nom='SAUCISSE SECHE' pro_critere='G1' pro_t1='0' pro_t2='5' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='4519' pro_nom='SAUCISSE PUR PORC CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='4518' pro_nom='SAUCISSE DE VOLAILLE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='4517' pro_nom='SAUCISSE DE VOLAILLE CRUE' pro_critere='F2' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='4516' pro_nom='SAUCISSE DE VIANDE CUITE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='4515' pro_nom='SAUCISSE DE TOULOUSE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='4514' pro_nom='SAUCISSE DE STRASBOURG CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='2'/>
		<z:row pro_numpro='4513' pro_nom='SAUCISSE DE STRASBOURG (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='4512' pro_nom='SAUCISSE DE STRASBOURG (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='4511' pro_nom='SAUCISSE DE SAVOIE ETUVÉE CRUE' pro_critere='F18' pro_t1='0' pro_t2='5' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='4510' pro_nom='SAUCISSE DE POISSON FRAICHE' pro_critere='J2' pro_t1='0' pro_t2='3' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4509' pro_nom='SAUCISSE DE MORTEAU CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='4508' pro_nom='SAUCISSE DE MONTBÉLIARD CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='4507' pro_nom='SAUCISSE DE MONTBÉLIARD CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='4506' pro_nom='SAUCISSE DE FRANCFORT CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='2'/>
		<z:row pro_numpro='4505' pro_nom='SAUCISSE DE FRANCFORT (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='4504' pro_nom='SAUCISSE DE FRANCFORT (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='4503' pro_nom='SAUCISSE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='4502' pro_nom='SAUCISSE COCKTAIL (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='4501' pro_nom='SAUCISSE AUX HERBES CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='4500' pro_nom='SAUCE VINAIGRETTE &#x22;MAISON&#x22;' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='4499' pro_nom='SAUCE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='9' pro_t4='4'/>
		<z:row pro_numpro='4498' pro_nom='SAUCE TARTARE &#x22;MAISON&#x22;' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='4497' pro_nom='SAUCE LIÉE A L&#x27;OEUF' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='9'
			 pro_t4='3'/>
		<z:row pro_numpro='4496' pro_nom='SAUCE FINANCIERE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='9' pro_t4='4'/>
		<z:row pro_numpro='4495' pro_nom='SAUCE BÉCHAMEL' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='9' pro_t4='2'/>
		<z:row pro_numpro='4494' pro_nom='SAUCE A LA CREME' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='9' pro_t4='3'/>
		<z:row pro_numpro='4493' pro_nom='SARDINE GRILLÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4492' pro_nom='SARDINE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='4491' pro_nom='SANGLIER CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='4490' pro_nom='SANDWICH CLUB' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='3' pro_t4='7'/>
		<z:row pro_numpro='4489' pro_nom='SANDWICH AU SAUCISSON SEC' pro_critere='G1' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='4488' pro_nom='SANDWICH AU JAMBON CRU' pro_critere='F3' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='4487' pro_nom='SANDWICH A LA CHARCUTERIE CUITE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='3'/>
		<z:row pro_numpro='4486' pro_nom='SALSIFIS CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='4485' pro_nom='SALADE VERTE' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4484' pro_nom='SALADE VERTE ASSAISONNÉE' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='4483' pro_nom='SALADES VERTES MÉLANGÉES' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='4482' pro_nom='SALADE VERTE 4G (F)' pro_critere='X1' pro_t1='0' pro_t2='4' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4481' pro_nom='RIZ ET CHARCUTERIE CUITE NON ASSAISONNÉS' pro_critere='X22' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='8'/>
		<z:row pro_numpro='4480' pro_nom='SALADE DE FRUITS FRAIS' pro_critere='X6' pro_t1='0' pro_t2='10' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='4479' pro_nom='SALADE DE FRUITS EN CONSERVE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='8'
			 pro_t4='3'/>
		<z:row pro_numpro='4478' pro_nom='SALADE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='4477' pro_nom='CRUDITÉS ET FROMAGE EN SALADE' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='18'/>
		<z:row pro_numpro='4476' pro_nom='SALADE CUIDITÉS CRUDITÉS ET POISSON' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='13'/>
		<z:row pro_numpro='4475' pro_nom='CRUDITÉS ET FROMAGE NON ASSAISONNÉS' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='17'/>
		<z:row pro_numpro='4474' pro_nom='SALADE CUIDITÉS CRUDITÉS ET VIANDE' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='11'/>
		<z:row pro_numpro='4473' pro_nom='SAINT HONORÉ S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='4472' pro_nom='SABAYON CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='4471' pro_nom='ROUSSETTE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='4470' pro_nom='ROULEAU DE PRINTEMPS' pro_critere='X22' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='6'/>
		<z:row pro_numpro='4469' pro_nom='ROULÉ DE VEAU CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='4468' pro_nom='ROULÉ DE JAMBON CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='4467' pro_nom='ROULÉ DE DINDONNEAU CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4466' pro_nom='ROULÉ AU FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='4465' pro_nom='ROULÉ A LA CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='4464' pro_nom='ROULÉ A LA CONFITURE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4463' pro_nom='ROTI DE VEAU FARCI CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='4462' pro_nom='ROTI DE VEAU CUIT FROID' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='9'
			 pro_t4='2'/>
		<z:row pro_numpro='4461' pro_nom='ROTI DE VEAU CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='4460' pro_nom='ROTI DE PORC CUIT FROID' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='9'
			 pro_t4='2'/>
		<z:row pro_numpro='4459' pro_nom='ROTI DE PORC FARCI CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='4458' pro_nom='ROTI DE PORC CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='4457' pro_nom='ROTI DE PORC CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='4456' pro_nom='ROTI DE MOUTON CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4455' pro_nom='ROTI DE LAPIN CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='4454' pro_nom='ROTI DE LAPIN CRU' pro_critere='F17' pro_t1='0' pro_t2='2' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4453' pro_nom='ROTI DE DINDONNEAU CUIT FROID' pro_critere='A2' pro_t1='0' pro_t2='8' pro_t3='9'
			 pro_t4='3'/>
		<z:row pro_numpro='4452' pro_nom='ROTI DE DINDONNEAU CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4451' pro_nom='ROTI DE DINDE CUIT FROID' pro_critere='A2' pro_t1='0' pro_t2='8' pro_t3='9'
			 pro_t4='3'/>
		<z:row pro_numpro='4450' pro_nom='ROTI DE DINDE CUIT' pro_critere='A2' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='4449' pro_nom='ROTI D&#x27;AGNEAU CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='4448' pro_nom='ROSBEEF CUIT FROID' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='4447' pro_nom='ROSBEEF CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4446' pro_nom='ROTI DE BOEUF CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='4445' pro_nom='ROLLMOPS' pro_critere='M2' pro_t1='0' pro_t2='3' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='4444' pro_nom='ROGNONS DE VEAU CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='4443' pro_nom='ROGNONS DE VEAU CRUS (D)' pro_critere='B16' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4442' pro_nom='ROGNONS DE PORC CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='4441' pro_nom='ROGNONS DE PORC CRUS (D)' pro_critere='B16' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='4440' pro_nom='ROGNONS DE GÉNISSE POCHÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='4439' pro_nom='ROGNONS DE GÉNISSE CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='4438' pro_nom='ROGNONS DE GÉNISSE CRUS (D)' pro_critere='B16' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4437' pro_nom='ROGNONS DE BOEUF CRUS (D)' pro_critere='B16' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4436' pro_nom='RIZ MAYONNAISE' pro_critere='X4' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='9'/>
		<z:row pro_numpro='4435' pro_nom='RIZ AU LAIT' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4434' pro_nom='VIANDE HACHÉE DE VEAU CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4433' pro_nom='VIANDE HACHÉE DE VEAU PANÉE CRUE' pro_critere='B1' pro_t1='0' pro_t2='1'
			 pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='4432' pro_nom='RISSOLETTE DE PORC CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4431' pro_nom='RISSOLETTE DE VOLAILLE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4430' pro_nom='RIZ CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='3'/>
		<z:row pro_numpro='4429' pro_nom='RIS DE VEAU POCHÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='4428' pro_nom='RILLETTES (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='4427' pro_nom='RILLETTES (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='4426' pro_nom='RELIGIEUSE CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='4425' pro_nom='RAVIOLIS AU FROMAGE CUISINÉS' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='4'/>
		<z:row pro_numpro='4424' pro_nom='RATATOUILLE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='4423' pro_nom='RADIS' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='2' pro_t4='5'/>
		<z:row pro_numpro='4422' pro_nom='RADIS 4G (F)' pro_critere='X1' pro_t1='0' pro_t2='4' pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='4421' pro_nom='QUICHE AU FROMAGE CUITE' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='8'/>
		<z:row pro_numpro='4420' pro_nom='QUEUE DE BOEUF CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4419' pro_nom='QUENELLE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6' pro_t4='2'/>
		<z:row pro_numpro='4418' pro_nom='QUENELLE (F)' pro_critere='Z5' pro_t1='0' pro_t2='5' pro_t3='18' pro_t4='1'/>
		<z:row pro_numpro='4417' pro_nom='QUENELLE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='18' pro_t4='1'/>
		<z:row pro_numpro='4416' pro_nom='QUATRE-QUARTS' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4415' pro_nom='PURÉE DE LÉGUMES CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='4414' pro_nom='PURÉE DE FRUITS CUITE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='8'
			 pro_t4='3'/>
		<z:row pro_numpro='4413' pro_nom='PUDDING' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4412' pro_nom='PRUNES AU SIROP' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='8' pro_t4='3'/>
		<z:row pro_numpro='4411' pro_nom='PRUNEAUX CUITS' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='8' pro_t4='3'/>
		<z:row pro_numpro='4410' pro_nom='PRUNEAUX AU VIN' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='8' pro_t4='3'/>
		<z:row pro_numpro='4409' pro_nom='PRUNEAUX AU SIROP' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='8' pro_t4='3'/>
		<z:row pro_numpro='4408' pro_nom='PRÉLEVEMENT SUR PIECE DE VIANDE CRUE P' pro_critere='E1' pro_t1='0' pro_t2='1'
			 pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4407' pro_nom='PRAIRES' pro_critere='K1' pro_t1='0' pro_t2='3' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4406' pro_nom='POULPE EN SALADE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='13'/>
		<z:row pro_numpro='4405' pro_nom='POULET ROTI CUIT FROID' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='9'
			 pro_t4='3'/>
		<z:row pro_numpro='4404' pro_nom='POULET ROTI' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='4403' pro_nom='POULET ENTIER CRU' pro_critere='F5' pro_t1='0' pro_t2='2' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4402' pro_nom='POULET CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='4401' pro_nom='POULE BOUILLIE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='4400' pro_nom='POUDRE POUR CREME PATISSIERE A FROID' pro_critere='P1' pro_t1='0' pro_t2='12'
			 pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='4399' pro_nom='POTÉE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='4398' pro_nom='POTAGE DE LÉGUMES CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='2'/>
		<z:row pro_numpro='4397' pro_nom='POTAGE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='4396' pro_nom='PORCELET FARCI (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='12' pro_t4='2'/>
		<z:row pro_numpro='4395' pro_nom='PORC CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='4394' pro_nom='POMMES DE TERRE MAYONNAISE' pro_critere='X4' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4393' pro_nom='POMMES DE TERRE FRITES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='4392' pro_nom='POMMES DE TERRE ET THON EN SALADE' pro_critere='X22' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='13'/>
		<z:row pro_numpro='4391' pro_nom='POMMES DE TERRE ET SAUCISSE CUITE EN SALADE' pro_critere='X22' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='11'/>
		<z:row pro_numpro='4390' pro_nom='POMMES DE TERRE ET MUSEAU EN SALADE' pro_critere='X22' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='11'/>
		<z:row pro_numpro='4389' pro_nom='POMMES DE TERRE EN SALADE' pro_critere='X4' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4388' pro_nom='POMMES DE TERRE SAUTÉES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='4387' pro_nom='POMMES DAUPHINES CUITES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='4386' pro_nom='POMMES DE TERRE CUISINÉES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='2'/>
		<z:row pro_numpro='4385' pro_nom='POMME CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='4384' pro_nom='POIVRONS ASSAISONNÉS' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4383' pro_nom='POIVRONS CUITS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='4382' pro_nom='POIVRON FARCI CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4381' pro_nom='POITRINE SALÉE CUITE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4380' pro_nom='POITRINE SALÉE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='4379' pro_nom='POITRINE FUMÉE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='4378' pro_nom='POITRINE DE VEAU FARCIE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='4377' pro_nom='POITRINE DE VEAU CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4376' pro_nom='POITRINE DE PORC FARCIE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='4375' pro_nom='POITRINE DE PORC CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4374' pro_nom='POISSON POCHÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4373' pro_nom='TRANCHE DE POISSON PANÉE SURGELÉE' pro_critere='H2' pro_t1='0' pro_t2='3'
			 pro_t3='3' pro_t4='4'/>
		<z:row pro_numpro='4372' pro_nom='POISSON FUMÉ' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='4371' pro_nom='TRANCHE DE POISSON SURGELÉE' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4370' pro_nom='TRANCHE DE POISSON FRAICHE' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4369' pro_nom='POISSON CUIT EN SALADE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='13'/>
		<z:row pro_numpro='4368' pro_nom='POISSON AU FROMAGE CUISINÉ' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='4367' pro_nom='POISSON CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='4366' pro_nom='POIS CHICHES EN SALADE' pro_critere='X4' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4365' pro_nom='POIREAUX CUITS NON ASSAISONNÉS' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='4364' pro_nom='POIREAUX CUITS ASSAISONNÉS' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4363' pro_nom='POIREAUX EN GRATIN' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='4362' pro_nom='POIREAUX CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='4361' pro_nom='POIRE CUITE SAUCE CHOCOLAT' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='8'
			 pro_t4='3'/>
		<z:row pro_numpro='4360' pro_nom='POIRE CUITE SAUCE CARAMEL' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='8'
			 pro_t4='3'/>
		<z:row pro_numpro='4359' pro_nom='POIRE A LA CREME CHANTILLY P' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='4358' pro_nom='POIRE AU VIN' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='8' pro_t4='3'/>
		<z:row pro_numpro='4357' pro_nom='POIRE A LA CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='4356' pro_nom='PLAT DE COTE DE BOEUF CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4355' pro_nom='PIZZA CUITE' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='7'/>
		<z:row pro_numpro='4354' pro_nom='PITHIVIERS' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4353' pro_nom='PISSALADIERE CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='7'/>
		<z:row pro_numpro='4352' pro_nom='PIPERADE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='4351' pro_nom='PINTADEAU CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='4350' pro_nom='PINTADE ROTIE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='4349' pro_nom='PINTADE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='4348' pro_nom='PILON DE VOLAILLE CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='4347' pro_nom='PIGEON CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='4346' pro_nom='PIEDS ET PAQUETS CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='4345' pro_nom='PIEDS DE VEAU CUITS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='4344' pro_nom='PIED DE PORC CUIT EN GELÉE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='14'
			 pro_t4='1'/>
		<z:row pro_numpro='4343' pro_nom='PIED DE PORC CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='4342' pro_nom='PETITS POIS CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='4341' pro_nom='PETIT SUISSE' pro_critere='O3' pro_t1='0' pro_t2='6' pro_t3='6' pro_t4='2'/>
		<z:row pro_numpro='4340' pro_nom='PETIT SALÉ CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4339' pro_nom='PETIT SALÉ CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='4338' pro_nom='PETITS FOURS' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4337' pro_nom='PERSIL HACHÉ SURGELÉ' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='4336' pro_nom='PECHE MELBA' pro_critere='O1' pro_t1='0' pro_t2='10' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='4335' pro_nom='PAUPIETTE DE VOLAILLE CUISINÉE' pro_critere='A2' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='4334' pro_nom='PAUPIETTE DE VOLAILLE CRUE' pro_critere='F2' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='4333' pro_nom='PAUPIETTE DE VEAU CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='4332' pro_nom='PAUPIETTE DE PORC CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='4331' pro_nom='PAUPIETTE DE PORC CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='4330' pro_nom='PAUPIETTE DE POISSON CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='4329' pro_nom='PAUPIETTE DE POISSON FRAICHE' pro_critere='J2' pro_t1='0' pro_t2='3' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4328' pro_nom='PAUPIETTE DE LAPIN CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='4327' pro_nom='PAUPIETTE DE DINDONNEAU CUISINÉE' pro_critere='A2' pro_t1='0' pro_t2='9'
			 pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='4326' pro_nom='PAUPIETTE DE BOEUF CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='4325' pro_nom='PAUPIETTE DE DINDONNEAU CRUE' pro_critere='F2' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='4324' pro_nom='PATES FRAICHES FARCIES' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='4323' pro_nom='PATES FARCIES CUISINÉES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='4'/>
		<z:row pro_numpro='4322' pro_nom='PATES CUISINÉES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='3'/>
		<z:row pro_numpro='4321' pro_nom='PATÉ FORESTIER (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='4320' pro_nom='PATÉ FORESTIER (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='4319' pro_nom='PATE FEUILLETÉE CRUE' pro_critere='A6' pro_t1='0' pro_t2='8' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4318' pro_nom='PATÉ DE VIANDE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='4317' pro_nom='PATÉ DE VIANDE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='4316' pro_nom='PATÉ DE LAPIN (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='4315' pro_nom='PATÉ DE LAPIN (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='4314' pro_nom='PATÉ DE FOIE DE VOLAILLE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='11'
			 pro_t4='1'/>
		<z:row pro_numpro='4313' pro_nom='PATÉ DE FOIE DE VOLAILLE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='11'
			 pro_t4='1'/>
		<z:row pro_numpro='4312' pro_nom='PATÉ DE FOIE AU POIVRE VERT (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='11'
			 pro_t4='1'/>
		<z:row pro_numpro='4311' pro_nom='PATÉ DE FOIE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='11' pro_t4='1'/>
		<z:row pro_numpro='4310' pro_nom='PATÉ DE FOIE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='11' pro_t4='1'/>
		<z:row pro_numpro='4309' pro_nom='PATÉ DE CAMPAGNE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='4308' pro_nom='PATÉ DE CAMPAGNE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='4307' pro_nom='PATÉ CROUTE RICHELIEU (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='13'
			 pro_t4='1'/>
		<z:row pro_numpro='4306' pro_nom='PATÉ CROUTE RICHELIEU (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='13'
			 pro_t4='1'/>
		<z:row pro_numpro='4305' pro_nom='PATÉ CROUTE DE POISSON' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='19'
			 pro_t4='1'/>
		<z:row pro_numpro='4304' pro_nom='PATÉ CROUTE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='13' pro_t4='1'/>
		<z:row pro_numpro='4303' pro_nom='PATÉ CROUTE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='13' pro_t4='1'/>
		<z:row pro_numpro='4302' pro_nom='PATE BRISÉE CRUE' pro_critere='A6' pro_t1='0' pro_t2='8' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4301' pro_nom='PATÉ BRETON (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='4300' pro_nom='PATÉ AU POIVRE VERT (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='4299' pro_nom='PATÉ AU CANARD (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='4298' pro_nom='PATE A CHOUX CUITE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4297' pro_nom='PARIS BREST CREME AU BEURRE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4296' pro_nom='PAN BAGNA' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='3' pro_t4='7'/>
		<z:row pro_numpro='4295' pro_nom='PAMPLEMOUSSE AU SIROP (CONSERVE)' pro_critere='A1' pro_t1='0' pro_t2='10'
			 pro_t3='8' pro_t4='3'/>
		<z:row pro_numpro='4294' pro_nom='PALOURDES' pro_critere='K1' pro_t1='0' pro_t2='3' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4293' pro_nom='PALETTE DE PORC CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4292' pro_nom='PALETTE DE PORC SAUMURÉE CUITE (D)' pro_critere='A5' pro_t1='0' pro_t2='5'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4291' pro_nom='PALERON DE BOEUF CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='4290' pro_nom='PAIN AUX RAISINS' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4289' pro_nom='PAELLA CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='4288' pro_nom='OSSO BUCCO CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='4287' pro_nom='OSSO BUCCO DE VEAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='4286' pro_nom='ONGLET DE BOEUF CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='4285' pro_nom='ONGLET CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4284' pro_nom='OMELETTE EN SALADE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='15'/>
		<z:row pro_numpro='4283' pro_nom='OMELETTE AU FROMAGE CUITE' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='4282' pro_nom='OMELETTE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='4281' pro_nom='OLIVES VERTES' pro_critere='A5' pro_t1='0' pro_t2='12' pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='4280' pro_nom='OIGNONS 4G (F)' pro_critere='X1' pro_t1='0' pro_t2='4' pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='4279' pro_nom='OIE ROTIE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='4278' pro_nom='OEUF DUR CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='4277' pro_nom='OEUFS BROUILLÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='4276' pro_nom='OEUFS AU LAIT' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4275' pro_nom='OEUFS A LA NEIGE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4274' pro_nom='OEUF POCHÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='4273' pro_nom='OEUF POCHE AU FROMAGE CUISINÉ' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='4272' pro_nom='OEUF EN GELÉE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='4271' pro_nom='OEUF DUR MAYONNAISE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='15'/>
		<z:row pro_numpro='4270' pro_nom='MACÉDOINE ET OEUF DUR EN SALADE' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='15'/>
		<z:row pro_numpro='4269' pro_nom='OEUF DUR ET THON NON ASSAISONNÉS' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='15'/>
		<z:row pro_numpro='4268' pro_nom='OEUF DUR DÉCOQUILLÉ ASSAISONNÉ' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='15'/>
		<z:row pro_numpro='4267' pro_nom='OEUF DUR DÉCOQUILLÉ' pro_critere='A1' pro_t1='0' pro_t2='7' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='4266' pro_nom='OEUF COCOTTE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='4265' pro_nom='NOIX DE VEAU CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='4264' pro_nom='NOIX DE VEAU CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4263' pro_nom='NOIX DE PÉTONCLE CRUE' pro_critere='J3' pro_t1='0' pro_t2='3' pro_t3='5'
			 pro_t4='3'/>
		<z:row pro_numpro='4262' pro_nom='NOIX DE JOUE DE BOEUF CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4261' pro_nom='NOIX DE JAMBON SEC' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='4260' pro_nom='NOIX DE COQUILLE SAINT JACQUES CRUE' pro_critere='J3' pro_t1='0' pro_t2='3'
			 pro_t3='5' pro_t4='3'/>
		<z:row pro_numpro='4259' pro_nom='NOIX D&#x27;ENTRECOTE DE BOEUF CUITE' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4258' pro_nom='NAVETS CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='4257' pro_nom='NAVARIN DE MOUTON CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4256' pro_nom='NAVARIN D&#x27;AGNEAU CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4255' pro_nom='MYRTILLES SURGELÉES (D)' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='6'/>
		<z:row pro_numpro='4254' pro_nom='MUSEAU EN SALADE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='12'/>
		<z:row pro_numpro='4253' pro_nom='MUSEAU (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='14' pro_t4='2'/>
		<z:row pro_numpro='4252' pro_nom='MUSEAU (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='14' pro_t4='2'/>
		<z:row pro_numpro='4251' pro_nom='MOUTON CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='4'/>
		<z:row pro_numpro='4250' pro_nom='PRÉPARATION HACHÉE DE VOLAILLE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='4' pro_t4='3'/>
		<z:row pro_numpro='4249' pro_nom='MOUSSELINE DE POISSON CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='4248' pro_nom='MOUSSE DE TOMATE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='2'/>
		<z:row pro_numpro='4247' pro_nom='MOUSSE DE MARRONS' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='4'/>
		<z:row pro_numpro='4246' pro_nom='MOUSSE DE LÉGUMES CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='2'/>
		<z:row pro_numpro='4245' pro_nom='MOUSSE DE FOIE DE VOLAILLE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='11'
			 pro_t4='1'/>
		<z:row pro_numpro='4244' pro_nom='MOUSSE DE FOIE DE VOLAILLE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='11'
			 pro_t4='1'/>
		<z:row pro_numpro='4243' pro_nom='MOUSSE DE FOIE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='11' pro_t4='1'/>
		<z:row pro_numpro='4242' pro_nom='MOUSSE DE FOIE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='11' pro_t4='1'/>
		<z:row pro_numpro='4241' pro_nom='MOUSSE DE CÉLERI CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='2'/>
		<z:row pro_numpro='4240' pro_nom='MOUSSE DE CAROTTE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='2'/>
		<z:row pro_numpro='4239' pro_nom='MOUSSE AUX FRUITS' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='4'/>
		<z:row pro_numpro='4238' pro_nom='MOUSSE AU CHOCOLAT' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='4'/>
		<z:row pro_numpro='4237' pro_nom='MOUSSAKA CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4236' pro_nom='MOULES MARINIERES CUISINÉES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='4235' pro_nom='MOULES FARCIES PRÉCUITES SURGELÉES' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='5' pro_t4='6'/>
		<z:row pro_numpro='4234' pro_nom='MOULES FARCIES CUITES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4233' pro_nom='MOULES DE HOLLANDE' pro_critere='K1' pro_t1='0' pro_t2='3' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4232' pro_nom='MOULES DE BRETAGNE' pro_critere='K1' pro_t1='0' pro_t2='3' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4231' pro_nom='MOULES DE BOUZIGUES' pro_critere='K1' pro_t1='0' pro_t2='3' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4230' pro_nom='MOULES D&#x27;IRLANDE' pro_critere='K1' pro_t1='0' pro_t2='3' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4229' pro_nom='MOULES D&#x27;ESPAGNE' pro_critere='K1' pro_t1='0' pro_t2='3' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4228' pro_nom='MOULES CUISINÉES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='4227' pro_nom='MOULES DE BOUCHOT' pro_critere='K1' pro_t1='0' pro_t2='3' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4226' pro_nom='MOULES' pro_critere='K1' pro_t1='0' pro_t2='3' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4225' pro_nom='MORUE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='4224' pro_nom='MORTADELLE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='4223' pro_nom='MORTADELLE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='4222' pro_nom='MIXÉ DE VOLAILLE CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='3'/>
		<z:row pro_numpro='4221' pro_nom='MIXÉ DE VIANDE CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4220' pro_nom='MIXÉ DE POISSON CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4219' pro_nom='LÉGUMES BOUILLIS MIXÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='4218' pro_nom='TRANCHE DE MÉROU FRAICHE' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4217' pro_nom='TRANCHE DE MERLU PANÉE SURGELÉE' pro_critere='H2' pro_t1='0' pro_t2='3'
			 pro_t3='3' pro_t4='4'/>
		<z:row pro_numpro='4216' pro_nom='MERLU CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4215' pro_nom='MERLAN CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4214' pro_nom='MERINGUE A LA CREME CHANTILLY S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4213' pro_nom='MERINGUE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4212' pro_nom='MERGUEZ CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='4211' pro_nom='MÉDAILLON DE SOLE FARCI SURGELÉ' pro_critere='J5' pro_t1='0' pro_t2='3'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4210' pro_nom='MÉDAILLON DE SOLE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='4209' pro_nom='MÉDAILLON DE SAUMON EN GELÉE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4208' pro_nom='MAYONNAISE DÉCONDITIONNÉE, MANIPULÉE' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='4207' pro_nom='MAYONNAISE &#x22;MAISON&#x22;' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='4206' pro_nom='MARGARINE DE CUISINE' pro_critere='Q5' pro_t1='0' pro_t2='12' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='4205' pro_nom='MAQUEREAU CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='4204' pro_nom='MANCHON DE CANARD CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='4203' pro_nom='MAGRET DE CANARD CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='4202' pro_nom='MAGRET D&#x27;OIE CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='4201' pro_nom='MADELEINE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4200' pro_nom='MACHE NON ASSAISONNÉE' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='4199' pro_nom='MACÉDOINE DE LÉGUMES NON ASSAISONNÉE' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='4198' pro_nom='MACÉDOINE DE LÉGUMES MAYONNAISE' pro_critere='X6' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='4197' pro_nom='MACÉDOINE ET CRABE MAYONNAISE' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='13'/>
		<z:row pro_numpro='4196' pro_nom='LOTTE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='4195' pro_nom='LONGE DE VEAU CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4194' pro_nom='LONGE DE PORC CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='4193' pro_nom='LONGE DE PORC CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='4192' pro_nom='LIMANDE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4191' pro_nom='LIEVRE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='4190' pro_nom='TRANCHE DE LIEU NOIR FRAICHE' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4189' pro_nom='TRANCHE DE LIEU JAUNE FRAICHE' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4188' pro_nom='LIEU CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='4187' pro_nom='LENTILLES NON ASSAISONNÉES' pro_critere='X4' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='4186' pro_nom='LENTILLES EN SALADE' pro_critere='X4' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='4185' pro_nom='LENTILLES CUISINÉES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='4184' pro_nom='LÉGUMES SURGELÉS' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2' pro_t4='5'/>
		<z:row pro_numpro='4183' pro_nom='LÉGUMES CUITS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='4182' pro_nom='LASAGNES CUITES AVEC FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='4'/>
		<z:row pro_numpro='4181' pro_nom='LASAGNES AU FROMAGE CUISINÉES' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='4'/>
		<z:row pro_numpro='4180' pro_nom='LARDONS CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='4179' pro_nom='LARD SALÉ CRU' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4178' pro_nom='LARD FUMÉ CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='4177' pro_nom='LARD CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='4176' pro_nom='LAPIN ROTI' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='4175' pro_nom='LAPIN CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='4174' pro_nom='LAPEREAU CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='4173' pro_nom='LANGUE DE VEAU CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='4172' pro_nom='LANGUE DE VEAU CRUE (D)' pro_critere='B16' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4171' pro_nom='LANGUE DE PORC EN GELÉE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='14'
			 pro_t4='1'/>
		<z:row pro_numpro='4170' pro_nom='LANGUE DE PORC CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='4169' pro_nom='LANGUE DE PORC CRUE (D)' pro_critere='B16' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='4168' pro_nom='LANGUE DE BOEUF EN SALADE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='11'/>
		<z:row pro_numpro='4167' pro_nom='LANGUE DE BOEUF CUITE FROIDE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='9'
			 pro_t4='4'/>
		<z:row pro_numpro='4166' pro_nom='LANGUE DE BOEUF CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='4165' pro_nom='LANGUE D&#x27;AGNEAU CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='4164' pro_nom='LANGUE D&#x27;AGNEAU CRUE (D)' pro_critere='B16' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='3'/>
		<z:row pro_numpro='4163' pro_nom='ABVT5 LANGOUSTINES' pro_critere='V5' pro_t1='0' pro_t2='3' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='4162' pro_nom='LANGOUSTINE ENTIERE CRUE CONGELÉE' pro_critere='I1' pro_t1='0' pro_t2='3'
			 pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='4161' pro_nom='LANGOUSTE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='4160' pro_nom='LAIT PASTEURISÉ CONDITIONNÉ (J+4)' pro_critere='N4' pro_t1='0' pro_t2='6'
			 pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='4159' pro_nom='LAIT PASTEURISÉ CONDITIONNÉ A LA DLC' pro_critere='N5' pro_t1='0' pro_t2='6'
			 pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='4158' pro_nom='LAIT CRU A CONSOMMER EN L&#x27;ETAT' pro_critere='N6' pro_t1='0' pro_t2='6'
			 pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4157' pro_nom='KNACK (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='4156' pro_nom='KNACK CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6' pro_t4='2'/>
		<z:row pro_numpro='4155' pro_nom='JUS DE VIANDE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='4154' pro_nom='JULIENNE DE LÉGUMES' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='1' pro_t4='6'/>
		<z:row pro_numpro='4153' pro_nom='JOUE DE RAIE FRAICHE' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='4152' pro_nom='JÉSUS CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='4151' pro_nom='JAUNE D&#x27;OEUF PASTEURISÉ' pro_critere='P2' pro_t1='0' pro_t2='7' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='4150' pro_nom='JARRET DE VEAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='4149' pro_nom='JARRET DE VEAU CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4148' pro_nom='JARRET DE PORC CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4147' pro_nom='JARRET DE BOEUF CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='4146' pro_nom='JARRET DE BOEUF CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4145' pro_nom='JAMBONNEAU CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6' pro_t4='2'/>
		<z:row pro_numpro='4144' pro_nom='JAMBONNEAU DE PORC SAUMURÉ CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4143' pro_nom='JAMBON PERSILLÉ (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='22' pro_t4='1'/>
		<z:row pro_numpro='4142' pro_nom='JAMBON PERSILLÉ (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='22' pro_t4='1'/>
		<z:row pro_numpro='4141' pro_nom='JAMBON DE PORC CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='4140' pro_nom='JAMBON CUIT ROTI' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6' pro_t4='2'/>
		<z:row pro_numpro='4139' pro_nom='JAMBON SEC' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='4138' pro_nom='JAMBON CUIT E (F)' pro_critere='C1' pro_t1='0' pro_t2='5' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4137' pro_nom='JAMBON CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6' pro_t4='2'/>
		<z:row pro_numpro='4136' pro_nom='JAMBON CUIT E (D)' pro_critere='C1' pro_t1='0' pro_t2='5' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4135' pro_nom='JAMBON BRAISÉ CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='2'/>
		<z:row pro_numpro='4134' pro_nom='JAMBON A L&#x27;OS CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='2'/>
		<z:row pro_numpro='4133' pro_nom='ILE FLOTTANTE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4132' pro_nom='HURE DE PORC (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='14' pro_t4='2'/>
		<z:row pro_numpro='4131' pro_nom='HUITRES FINE DE CLAIRE' pro_critere='K1' pro_t1='0' pro_t2='3' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='4130' pro_nom='HUITRES DE NORMANDIE' pro_critere='K1' pro_t1='0' pro_t2='3' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4129' pro_nom='HUITRES DE MARENNES' pro_critere='K1' pro_t1='0' pro_t2='3' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4128' pro_nom='HUITRES DE BRETAGNE' pro_critere='K1' pro_t1='0' pro_t2='3' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4127' pro_nom='HUITRES DE BOUZIGUES' pro_critere='K1' pro_t1='0' pro_t2='3' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4126' pro_nom='HUITRES' pro_critere='K1' pro_t1='0' pro_t2='3' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4125' pro_nom='HOMARD CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='4124' pro_nom='HARICOTS VERTS NON ASSAISONNÉS' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='4123' pro_nom='HARICOTS VERTS ASSAISONNÉS' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4122' pro_nom='HARICOTS VERTS CUITS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='4121' pro_nom='HARICOTS ROUGES ASSAISONNÉS' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4120' pro_nom='HARICOTS ROUGES CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='2'/>
		<z:row pro_numpro='4119' pro_nom='HARICOTS BLANCS ASSAISONNÉS' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4118' pro_nom='HARICOTS BLANCS CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='2'/>
		<z:row pro_numpro='4117' pro_nom='HARICOTS BEURRE CUITS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='4116' pro_nom='HARENG SAUR' pro_critere='M2' pro_t1='0' pro_t2='3' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='4115' pro_nom='HAMBURGER CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4114' pro_nom='HADDOCK FUMÉ' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='4113' pro_nom='HADDOCK CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4112' pro_nom='HACHIS PARMENTIER CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4111' pro_nom='GRILLE AUX POMMES CUIT' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='4110' pro_nom='GRILLADE DE PORC CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='4109' pro_nom='POMMES DE TERRE EN GRATIN' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='2'/>
		<z:row pro_numpro='4108' pro_nom='GRATIN DE POISSON CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='4107' pro_nom='PATES EN GRATIN' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='3'/>
		<z:row pro_numpro='4106' pro_nom='LÉGUMES AU FROMAGE EN GRATIN' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='2'/>
		<z:row pro_numpro='4105' pro_nom='LÉGUMES EN GRATIN' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='4104' pro_nom='GRATIN DE FRUITS DE MER CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='4103' pro_nom='GRATIN DAUPHINOIS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='4102' pro_nom='GRAS DOUBLE CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4101' pro_nom='GRAS DOUBLE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='4100' pro_nom='GOULASCH DE BOEUF CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='4099' pro_nom='GOUGERE AU FROMAGE CUITE' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='8'/>
		<z:row pro_numpro='4098' pro_nom='GODIVEAU CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='4097' pro_nom='GNOCCHIS CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='3'/>
		<z:row pro_numpro='4096' pro_nom='GNOCCHIS FRAIS' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4095' pro_nom='GLAND CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='4094' pro_nom='GIGOT DE MOUTON CUIT FROID' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='9'
			 pro_t4='1'/>
		<z:row pro_numpro='4093' pro_nom='GIGOT DE MOUTON CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4092' pro_nom='ROTI DE DINDE TRAITÉ EN SALAISON CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4091' pro_nom='GIGOT D&#x27;AGNEAU CUIT FROID' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='9'
			 pro_t4='1'/>
		<z:row pro_numpro='4090' pro_nom='GIGOT D&#x27;AGNEAU CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='4089' pro_nom='GIBIER CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='4088' pro_nom='DÉCOUPE DE GIBIER A POILS CRUE' pro_critere='B2' pro_t1='0' pro_t2='2' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='4087' pro_nom='GÉSIERS DE VOLAILLE CRUS' pro_critere='F6' pro_t1='0' pro_t2='2' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='4086' pro_nom='GÉNOISE CREME CHANTILLY S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4085' pro_nom='GÉNOISE CREME CHANTILLY P' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='4084' pro_nom='GÉNOISE AUX FRUITS' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='4083' pro_nom='GÉNOISE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4082' pro_nom='GELÉE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='4081' pro_nom='GATEAU DE SEMOULE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4080' pro_nom='GATEAU DE RIZ' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4079' pro_nom='GATEAU DE FOIE CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='4078' pro_nom='GATEAU CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='4077' pro_nom='GATEAU CREME MOUSSELINE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='4076' pro_nom='GATEAU CREME AU BEURRE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4075' pro_nom='GATEAU AUX FRUITS CUITS' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4074' pro_nom='GATEAU AU FROMAGE BLANC' pro_critere='Z5' pro_t1='0' pro_t2='10' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4073' pro_nom='GATEAU A LA GANACHE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='4072' pro_nom='GASPACHO' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='4071' pro_nom='GANACHE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='4070' pro_nom='GAMBAS CUISINÉES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='4069' pro_nom='TOURTE A LA VIANDE CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='4'/>
		<z:row pro_numpro='4068' pro_nom='GALETTE A LA FRANGIPANE CUITE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='4067' pro_nom='GALANTINE DE VOLAILLE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='12'
			 pro_t4='1'/>
		<z:row pro_numpro='4066' pro_nom='GALANTINE DE VOLAILLE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='12'
			 pro_t4='1'/>
		<z:row pro_numpro='4065' pro_nom='GALANTINE DE PORC (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='12'
			 pro_t4='1'/>
		<z:row pro_numpro='4064' pro_nom='GALANTINE AUX OLIVES (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='12'
			 pro_t4='1'/>
		<z:row pro_numpro='4063' pro_nom='FUMET DE POISSON' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='4062' pro_nom='FRUITS SURGELÉS' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2' pro_t4='6'/>
		<z:row pro_numpro='4061' pro_nom='FRUITS CUITS' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='8' pro_t4='3'/>
		<z:row pro_numpro='4060' pro_nom='FRUITS A LA CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='4059' pro_nom='FRUITS CUITS AU SIROP' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='8'
			 pro_t4='3'/>
		<z:row pro_numpro='4058' pro_nom='FRUITS A LA CREME CHANTILLY S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='4057' pro_nom='FRUITS A LA CREME CHANTILLY P' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='4056' pro_nom='FROMAGE DE TETE EN SALADE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='12'/>
		<z:row pro_numpro='4055' pro_nom='FROMAGE DE TETE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='14' pro_t4='1'/>
		<z:row pro_numpro='4054' pro_nom='FRITURE D&#x27;ÉPERLAN CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='3'/>
		<z:row pro_numpro='4053' pro_nom='FRICASSÉE DE VOLAILLE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='4052' pro_nom='FRICANDEAU CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6' pro_t4='2'/>
		<z:row pro_numpro='4051' pro_nom='FRIAND AU POISSON CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='3'/>
		<z:row pro_numpro='4050' pro_nom='FRIAND CRU AU POISSON CRU' pro_critere='J4' pro_t1='0' pro_t2='8' pro_t3='6'
			 pro_t4='5'/>
		<z:row pro_numpro='4049' pro_nom='FRIAND CRU AU FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='4048' pro_nom='FRIAND AU FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='4047' pro_nom='FRIAND A LA VIANDE CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='4'/>
		<z:row pro_numpro='4046' pro_nom='FRIAND A LA SAUCISSE CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='4'/>
		<z:row pro_numpro='4045' pro_nom='FRANGIPANE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4044' pro_nom='FRAMBOISIER CREME MOUSSELINE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='4043' pro_nom='FRAMBOISES SURGELÉES' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2' pro_t4='6'/>
		<z:row pro_numpro='4042' pro_nom='FRAISES SURGELÉES' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2' pro_t4='6'/>
		<z:row pro_numpro='4041' pro_nom='FORET NOIRE CREME CHANTILLY M' pro_critere='P3' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='3'/>
		<z:row pro_numpro='4040' pro_nom='FORET NOIRE CREME CHANTILLY P' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='4039' pro_nom='FOND DE SAUCE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='4038' pro_nom='FONDS D&#x27;ARTICHAUTS CUITS ASSAISONNÉS' pro_critere='X6' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='4037' pro_nom='FOND D&#x27;ARTICHAUT CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='2'/>
		<z:row pro_numpro='4036' pro_nom='FOIE GRAS CUIT (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='21' pro_t4='1'/>
		<z:row pro_numpro='4035' pro_nom='FOIE GRAS CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='21' pro_t4='1'/>
		<z:row pro_numpro='4034' pro_nom='FOIE DE VOLAILLE CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='4033' pro_nom='FOIE DE VOLAILLE CRU' pro_critere='F6' pro_t1='0' pro_t2='2' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4032' pro_nom='FOIE DE VEAU CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='4031' pro_nom='FOIE DE LAPIN CRU' pro_critere='F6' pro_t1='0' pro_t2='2' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4030' pro_nom='FOIE DE GÉNISSE CRU (D)' pro_critere='B16' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4029' pro_nom='FOIE DE GÉNISSE CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='4028' pro_nom='FOIE DE GÉNISSE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='4027' pro_nom='FOIE DE BOEUF CRU (D)' pro_critere='B16' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4026' pro_nom='FOIE D&#x27;AGNEAU CRU (D)' pro_critere='B16' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='3'/>
		<z:row pro_numpro='4025' pro_nom='FOIE CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='4024' pro_nom='STEAK HACHÉ DE VEAU CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4023' pro_nom='FLAN PATISSIER' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4022' pro_nom='FLAN AUX OEUFS' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4021' pro_nom='FLAN AU CARAMEL' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='4020' pro_nom='FLAGEOLETS CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='4019' pro_nom='FILET MIGNON DE VEAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='4018' pro_nom='FILET DE VOLAILLE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='4017' pro_nom='FILET DE TRUITE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='4016' pro_nom='FILET DE SAINT PIERRE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='4015' pro_nom='FILET DE SOLE SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4014' pro_nom='FILET DE SOLE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='4013' pro_nom='FILET DE PORC FUMÉ CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='4012' pro_nom='FILET DE PORC CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='4011' pro_nom='FILET DE POISSON SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4010' pro_nom='FILET DE POISSON CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='4009' pro_nom='FILET DE POISSON FUMÉ' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='4008' pro_nom='FILET DE POISSON' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='4007' pro_nom='FILET DE POISSON CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='4006' pro_nom='FILET DE PERCHE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='4005' pro_nom='FILET DE MOSTELLE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='4004' pro_nom='FILET DE MORUETTE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='4003' pro_nom='FILET DE MORUE SALÉE' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='4002' pro_nom='FILET DE MERLU SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='4001' pro_nom='FILET DE MERLU CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='4000' pro_nom='FILET DE MERLAN SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3999' pro_nom='FILET DE MERLAN CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='3998' pro_nom='FILET DE MAQUEREAU FUMÉ' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='3997' pro_nom='FILET DE MAQUEREAU FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3996' pro_nom='FILET DE LOUP CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='3995' pro_nom='FILET DE LIMANDE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='3994' pro_nom='FILET DE LIEU POCHÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='3993' pro_nom='FILET DE LIEU CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='3992' pro_nom='FILET DE JULIENNE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='3991' pro_nom='FILET DE FLÉTAN CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='3990' pro_nom='FILET DE DINDE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='3989' pro_nom='FILET DE DAURADE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='3988' pro_nom='FILET DE COLIN CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='3987' pro_nom='FILET DE CARRELET SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3986' pro_nom='FILET DE CABILLAUD SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3985' pro_nom='FILET DE CABILLAUD CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='3984' pro_nom='FILET DE BROCHET CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='3983' pro_nom='FILET DE BOEUF CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3982' pro_nom='FILET DE BOEUF CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='3981' pro_nom='FILET DE BAR CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='3980' pro_nom='FILET D&#x27;ÉGLEFIN CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='3979' pro_nom='FIGUE CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3978' pro_nom='FICELLE PICARDE CUITE' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='2'/>
		<z:row pro_numpro='3977' pro_nom='FEUILLETÉ DE RIS DE VEAU CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='3976' pro_nom='FEUILLETÉ AUX FRUITS CUITS' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='3975' pro_nom='FEUILLETÉ AUX LÉGUMES CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='9'/>
		<z:row pro_numpro='3974' pro_nom='FEUILLETÉ AUX FRUITS DE MER CUIT' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='3'/>
		<z:row pro_numpro='3973' pro_nom='FEUILLETÉ AUX CHAMPIGNONS CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='3972' pro_nom='FEUILLETÉ POISSON BÉCHAMEL CUIT' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='3'/>
		<z:row pro_numpro='3971' pro_nom='FEUILLETÉ JAMBON BÉCHAMEL CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='3970' pro_nom='FEUILLETÉ AU FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='3969' pro_nom='FEUILLETÉ CRU AU FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='3968' pro_nom='FEUILLETÉ CRU AU POISSON CRU' pro_critere='J4' pro_t1='0' pro_t2='8' pro_t3='6'
			 pro_t4='5'/>
		<z:row pro_numpro='3967' pro_nom='FEUILLETÉ A LA VIANDE CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='4'/>
		<z:row pro_numpro='3966' pro_nom='FEUILLETÉ CRU A LA VIANDE CRUE' pro_critere='F4' pro_t1='0' pro_t2='8' pro_t3='6'
			 pro_t4='4'/>
		<z:row pro_numpro='3965' pro_nom='FEUILLE DE VIGNE FARCIE CUITE NON ASSAISONNÉE' pro_critere='x4' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='10'/>
		<z:row pro_numpro='3964' pro_nom='FENOUIL CRU ASSAISONNÉ' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3963' pro_nom='FENOUIL CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='3962' pro_nom='FAUX FILET DE CHEVAL CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='5'/>
		<z:row pro_numpro='3961' pro_nom='FARINE' pro_critere='A6' pro_t1='0' pro_t2='13' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='3960' pro_nom='FARCE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3959' pro_nom='FARCE CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='3958' pro_nom='FAR BRETON' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3957' pro_nom='FAISAN CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='3956' pro_nom='ESCARGOTS CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='3955' pro_nom='ESCALOPE DE VOLAILLE PANÉE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='3954' pro_nom='ESCALOPE DE VOLAILLE PANÉE CRUE' pro_critere='F10' pro_t1='0' pro_t2='2'
			 pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='3953' pro_nom='ESCALOPE DE VOLAILLE POCHÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='3952' pro_nom='ESCALOPE DE VOLAILLE CORDON BLEU CRUE' pro_critere='F10' pro_t1='0' pro_t2='2'
			 pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='3951' pro_nom='ESCALOPE DE VEAU CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='3950' pro_nom='ESCALOPE DE VEAU CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='3949' pro_nom='ESCALOPE DE PORC PANÉE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='3948' pro_nom='ESCALOPE DE PORC CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='3947' pro_nom='ESCALOPE DE PORC CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='3946' pro_nom='ESCALOPE DE DINDE POCHÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='3945' pro_nom='PURÉE D&#x27;ÉPINARD CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='3944' pro_nom='ÉPINARDS CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='3943' pro_nom='ÉPINARDS CUITS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='3942' pro_nom='ÉPICES' pro_critere='U7' pro_t1='0' pro_t2='12' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='3941' pro_nom='ÉPAULE DE VEAU CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='3940' pro_nom='ÉPAULE DE PORC CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='3939' pro_nom='ÉPAULE DE MOUTON CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3938' pro_nom='ÉPAULE D&#x27;AGNEAU FARCIE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3937' pro_nom='ÉPAULE D&#x27;AGNEAU CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3936' pro_nom='ÉPAULE CUITE E (D)' pro_critere='C1' pro_t1='0' pro_t2='5' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3935' pro_nom='ENTRECOTE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='3934' pro_nom='ENDIVE CRUE NON ASSAISONNÉE' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='5'/>
		<z:row pro_numpro='3933' pro_nom='ENDIVE ASSAISONNÉE' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='3932' pro_nom='ENDIVE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='3931' pro_nom='ENDIVE AU FROMAGE EN GRATIN' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='2'/>
		<z:row pro_numpro='3930' pro_nom='ENCORNETS CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='3929' pro_nom='ÉMINCÉ DE VOLAILLE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='3928' pro_nom='ÉMINCÉ DE VEAU CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='3927' pro_nom='ÉMINCÉ DE PORC CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='3926' pro_nom='ÉMINCÉ DE BOEUF CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='3925' pro_nom='ÉCLAIR CREME CHANTILLY S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3924' pro_nom='ÉCLAIR CREME CHANTILLY P' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='3923' pro_nom='ÉCLAIR CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3922' pro_nom='ÉCHINE DE PORC CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='3921' pro_nom='BEIGNET CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3920' pro_nom='DIPLOMATE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3919' pro_nom='ESCALOPE DE DINDE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3918' pro_nom='DINDE ROTIE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='3917' pro_nom='DINDE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='3916' pro_nom='DESSERT LACTÉ GÉLIFIÉ' pro_critere='O6' pro_t1='0' pro_t2='6' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='3915' pro_nom='LAIT GÉLIFIÉ' pro_critere='O6' pro_t1='0' pro_t2='6' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='3914' pro_nom='VIANDE HACHÉE DE VOLAILLE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='3913' pro_nom='TRANCHE DE THON SURGELÉE' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3912' pro_nom='TRANCHE DE SAUMON SURGELÉE' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3911' pro_nom='DARNE DE SAUMON CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='3910' pro_nom='DARNE DE POISSON CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='3909' pro_nom='DARNE DE MERLU CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='3908' pro_nom='DARNE DE LIEU CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='3907' pro_nom='DARNE DE COLIN CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='3906' pro_nom='CUISSES DE GRENOUILLES CUISINÉES' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='3905' pro_nom='CUISSE DE POULET ROTI' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='3904' pro_nom='CUISSE DE POULET CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='3903' pro_nom='CUISSE DE POULE CRUE' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='3902' pro_nom='CUISSE DE DINDONNEAU CRUE' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3901' pro_nom='CUISSE DE DINDE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='3900' pro_nom='CUISSE DE DINDE CRUE' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='3899' pro_nom='CUISSE DE CANARD CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='3898' pro_nom='CUIDITÉS VARIÉES MAYONNAISE' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='3897' pro_nom='FÉCULENTS VARIÉS NON ASSAISONNÉS' pro_critere='X4' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='3896' pro_nom='FÉCULENTS DIVERS MAYONNAISE' pro_critere='X4' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='3895' pro_nom='FÉCULENTS DIVERS EN SALADE' pro_critere='X4' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='3894' pro_nom='CRUDITÉS MAYONNAISE' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='3893' pro_nom='CROUSTADE DE VOLAILLE CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='4'/>
		<z:row pro_numpro='3892' pro_nom='CROUSTADE AUX FRUITS DE MER CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='3891' pro_nom='CROQUETTE DE VOLAILLE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='3'/>
		<z:row pro_numpro='3890' pro_nom='CROQUETTE DE POISSON PANÉE SURGELÉE' pro_critere='J5' pro_t1='0' pro_t2='3'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3889' pro_nom='CROQUETTE DE POISSON CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='3'/>
		<z:row pro_numpro='3888' pro_nom='CROQUETTE DE BOEUF CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='3887' pro_nom='VIANDE HACHÉE DE BOEUF CRUE' pro_critere='B1' pro_t1='0' pro_t2='1' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3886' pro_nom='CROQUE MONSIEUR CUIT' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='2'/>
		<z:row pro_numpro='3885' pro_nom='CROQUE MONSIEUR FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='3884' pro_nom='CROISSANT FOURRÉ JAMBON FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='3883' pro_nom='CROISSANT AUX AMANDES' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='3882' pro_nom='CROISSANT AU JAMBON CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='3881' pro_nom='CROISSANT CRU AU JAMBON' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='3880' pro_nom='CROISSANT BÉCHAMEL CUIT AU FROMAGE A CUIRE' pro_critere='A5' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='3879' pro_nom='CROISSANT AUX ABRICOTS' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='3878' pro_nom='CREVETTES ROSES ENTIERES CRUES CONGELÉES' pro_critere='J1' pro_t1='0' pro_t2='3'
			 pro_t3='7' pro_t4='6'/>
		<z:row pro_numpro='3877' pro_nom='CREVETTES GRISES CUITES' pro_critere='A1' pro_t1='0' pro_t2='3' pro_t3='7'
			 pro_t4='3'/>
		<z:row pro_numpro='3876' pro_nom='CREVETTES ENTIERES CRUES TROPICALES CONGELÉES (D)' pro_critere='I1' pro_t1='0'
			 pro_t2='3' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='3875' pro_nom='CREVETTES CUITES DÉCORTIQUÉES' pro_critere='I3' pro_t1='0' pro_t2='3' pro_t3='7'
			 pro_t4='4'/>
		<z:row pro_numpro='3874' pro_nom='CRÉPINETTE DE VOLAILLE CRUE' pro_critere='F2' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='3873' pro_nom='CRÉPINETTE DE POISSON CRUE' pro_critere='J2' pro_t1='0' pro_t2='3' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='3872' pro_nom='CRÉPINETTE CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='3871' pro_nom='CREPE FARCIE CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='2'/>
		<z:row pro_numpro='3870' pro_nom='CREPE A LA BÉCHAMEL CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='3869' pro_nom='CREPE AUX FRUITS DE MER PRÉCUITE' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='3'/>
		<z:row pro_numpro='3868' pro_nom='CREPE AUX FRUITS DE MER CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='3'/>
		<z:row pro_numpro='3867' pro_nom='CREPE BÉCHAMEL AUX CHAMPIGNONS CUITE' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='3866' pro_nom='CREPE CHAMPIGNONS CUITE AVEC FROMAGE A CUIRE' pro_critere='A5' pro_t1='0'
			 pro_t2='8' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='3865' pro_nom='CREPE BÉCHAMEL AU JAMBON CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='3864' pro_nom='CREPE CRUE AU JAMBON' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='2'/>
		<z:row pro_numpro='3863' pro_nom='CREPE BÉCHAMEL AU FROMAGE CUITE' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='3862' pro_nom='CREPE BÉCHAMEL CUITE AU FROMAGE A CUIRE' pro_critere='A5' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='3861' pro_nom='CREPE SUCRÉE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='3860' pro_nom='CREME RENVERSÉE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3859' pro_nom='CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='3858' pro_nom='CREME MOUSSELINE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='4'/>
		<z:row pro_numpro='3857' pro_nom='CREME MERINGUÉE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='3856' pro_nom='CREME FRAICHE MATURÉE PASTEURISÉE' pro_critere='O5' pro_t1='0' pro_t2='6'
			 pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='3855' pro_nom='CREME DE FOIE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='11' pro_t4='1'/>
		<z:row pro_numpro='3854' pro_nom='CREME CHANTILLY S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3853' pro_nom='CREME CHANTILLY P' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='3852' pro_nom='CREME CHANTILLY M' pro_critere='P3' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='3851' pro_nom='CREME CARAMEL' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3850' pro_nom='CREME BRULÉE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3849' pro_nom='CREME AU BEURRE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='3848' pro_nom='CREME ANGLAISE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='3847' pro_nom='CRABE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='3846' pro_nom='SEMOULE A COUSCOUS CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='5'/>
		<z:row pro_numpro='3845' pro_nom='COUSCOUS CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='3844' pro_nom='COURGETTE CRUE RAPÉE' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='2' pro_t4='5'/>
		<z:row pro_numpro='3843' pro_nom='COURGETTE FARCIE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='3842' pro_nom='COURGETTE CUITE ASSAISONNÉE' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='3841' pro_nom='COURGETTE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='3840' pro_nom='COURGETTE RAPÉE ASSAISONNÉE' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3839' pro_nom='COULIS DE TOMATE CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='3838' pro_nom='COULIS DE POIVRONS CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='3837' pro_nom='COULIS DE FRUITS CUITS' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='8'
			 pro_t4='4'/>
		<z:row pro_numpro='3836' pro_nom='COTTY SALÉ CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='3835' pro_nom='COTE DE VEAU CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='3834' pro_nom='COTE DE VEAU CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='3833' pro_nom='COTE DE PORC CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='3832' pro_nom='COTE DE MOUTON CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='3831' pro_nom='COTE DE MOUTON CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='4'/>
		<z:row pro_numpro='3830' pro_nom='COTE DE BOEUF CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3829' pro_nom='COTES DE BETTES CUISINÉES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='2'/>
		<z:row pro_numpro='3828' pro_nom='COTE D&#x27;AGNEAU CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3827' pro_nom='COTE D&#x27;AGNEAU CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='3826' pro_nom='CORDON BLEU DE DINDONNEAU CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3825' pro_nom='COQUILLE SAINT JACQUES PRÉCUITE' pro_critere='J3' pro_t1='0' pro_t2='3' pro_t3='5'
			 pro_t4='3'/>
		<z:row pro_numpro='3824' pro_nom='COQUILLE SAINT JACQUES' pro_critere='K1' pro_t1='0' pro_t2='3' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='3823' pro_nom='COQUILLE SAINT JACQUES CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='3822' pro_nom='COQUILLE DE POISSON CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='3821' pro_nom='COQUILLE AUX FRUITS DE MER CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='3820' pro_nom='COQUES' pro_critere='K1' pro_t1='0' pro_t2='3' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='3819' pro_nom='COQUELET CRU' pro_critere='F5' pro_t1='0' pro_t2='2' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='3818' pro_nom='COQUELET ROTI' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='3817' pro_nom='COQUELET CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='3816' pro_nom='COQ AU VIN CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='3815' pro_nom='TRANCHE DE CONGRE FRAICHE' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3814' pro_nom='CONFIT DE PORC CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='2'/>
		<z:row pro_numpro='3813' pro_nom='CONFIT DE FOIE DE VOLAILLE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='9'
			 pro_t4='1'/>
		<z:row pro_numpro='3812' pro_nom='CONFIT DE FOIE DE PORC (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='9'
			 pro_t4='1'/>
		<z:row pro_numpro='3811' pro_nom='CONFIT DE CANARD CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='2'/>
		<z:row pro_numpro='3810' pro_nom='CONFIT D&#x27;OIE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='2'/>
		<z:row pro_numpro='3809' pro_nom='CONCOMBRE NON ASSAISONNÉ' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='5'/>
		<z:row pro_numpro='3808' pro_nom='CONCOMBRE TRANCHÉ' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='3807' pro_nom='COMPOTE DE FRUITS CUITS' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='8'
			 pro_t4='3'/>
		<z:row pro_numpro='3806' pro_nom='COMPOTE DE FRUITS EN CONSERVE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='8'
			 pro_t4='3'/>
		<z:row pro_numpro='3805' pro_nom='COLLIER DE MOUTON CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='3804' pro_nom='COLLIER DE BOEUF CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='3803' pro_nom='TRANCHE DE COLIN SURGELÉE' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3802' pro_nom='TRANCHE DE COLIN PANÉE SURGELÉE' pro_critere='H2' pro_t1='0' pro_t2='3'
			 pro_t3='3' pro_t4='4'/>
		<z:row pro_numpro='3801' pro_nom='COLIN EN TRANCHE CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='3800' pro_nom='COEURS DE VOLAILLE CRUS' pro_critere='F6' pro_t1='0' pro_t2='2' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='3799' pro_nom='COEURS DE PALMIER ASSAISONNÉS' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='3798' pro_nom='COEUR DE VEAU CRU (D)' pro_critere='B16' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='3797' pro_nom='COEUR DE SCAROLE' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='3796' pro_nom='COEUR DE PORC CRU (D)' pro_critere='B16' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='3795' pro_nom='COEUR DE LAITUE' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='3794' pro_nom='COEUR DE LAITUE 4G (F)' pro_critere='X1' pro_t1='0' pro_t2='4' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3793' pro_nom='COEUR D&#x27;AGNEAU CRU (D)' pro_critere='B16' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='3'/>
		<z:row pro_numpro='3792' pro_nom='FRUITS DE MER PRÉCUITS' pro_critere='J3' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='6'/>
		<z:row pro_numpro='3791' pro_nom='CLAMS' pro_critere='K1' pro_t1='0' pro_t2='3' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='3790' pro_nom='CLAFOUTIS' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3789' pro_nom='CIVET DE SANGLIER CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='3788' pro_nom='CIVET DE PORCELET CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='3787' pro_nom='CIVET DE PORC CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='3786' pro_nom='CIVET DE LIEVRE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='3785' pro_nom='CIVET DE LAPIN CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='3784' pro_nom='CIVET DE CHEVREUIL CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='3783' pro_nom='CHOUX ROUGES CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='2'/>
		<z:row pro_numpro='3782' pro_nom='CHOUX DE BRUXELLES CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='2'/>
		<z:row pro_numpro='3781' pro_nom='CHOUX CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='3780' pro_nom='CHOUCROUTE GARNIE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='3779' pro_nom='CHOUCROUTE GARNIE SOUS VIDE' pro_critere='A5' pro_t1='0' pro_t2='9' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='3778' pro_nom='CHOUCROUTE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='3777' pro_nom='CHOUCROUTE CRUE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='22' pro_t4='4'/>
		<z:row pro_numpro='3776' pro_nom='CHOU VERT RAPÉ' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='3775' pro_nom='CHOU VERT RAPÉ ASSAISONNÉ' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3774' pro_nom='CHOU ROUGE RAPÉ' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='3773' pro_nom='CHOU ROUGE RAPÉ MAYONNAISE' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3772' pro_nom='CHOU NON GARNI' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='3771' pro_nom='CHOU FLEUR CUIT NON ASSAISONNÉ' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='3770' pro_nom='CHOU-FLEUR CUIT MAYONNAISE' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='3769' pro_nom='CHOU FLEUR CUIT ASSAISONNÉ' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='3768' pro_nom='CHOU FLEUR CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='3767' pro_nom='CHOU-FLEUR CUIT A LA GRECQUE' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='3766' pro_nom='CHOU FARCI CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3765' pro_nom='CHOU CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3764' pro_nom='CHOU CREME MOUSSELINE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='3763' pro_nom='CHOU CREME CHANTILLY S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3762' pro_nom='CHOU CREME CHANTILLY P' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='3761' pro_nom='CHOU CREME CHANTILLY M' pro_critere='P3' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='3'/>
		<z:row pro_numpro='3760' pro_nom='CHOU CREME AU BEURRE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='3759' pro_nom='CHOU BRAISÉ CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='3758' pro_nom='CHOU BLANC RAPÉ' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='3757' pro_nom='CHOU BLANC RAPÉ ASSAISONNÉ' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3756' pro_nom='CHOU BLANC RAPÉ 4G (F)' pro_critere='X1' pro_t1='0' pro_t2='4' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='3755' pro_nom='CHORIZO' pro_critere='G1' pro_t1='0' pro_t2='5' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='3754' pro_nom='CHOCOLAT CHAUD' pro_critere='O9' pro_t1='0' pro_t2='11' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3753' pro_nom='CHIPOLATA DE VOLAILLE CRUE' pro_critere='F2' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='3752' pro_nom='CHIPOLATA CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='3751' pro_nom='CHEVREUIL CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='3750' pro_nom='HAMBURGER AVEC FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='3749' pro_nom='CHAUSSON AUX POMMES CRU' pro_critere='A6' pro_t1='0' pro_t2='8' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='3748' pro_nom='CHAUSSON AUX POMMES CUIT' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='3747' pro_nom='CHARLOTTE CREME CHANTILLY S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='3746' pro_nom='CHAMPIGNONS CUITS ASSAISONNÉS' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='3745' pro_nom='CHAMPIGNONS CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='3744' pro_nom='CHAMPIGNONS CRUS NON ASSAISONNÉS' pro_critere='X3' pro_t1='0' pro_t2='4'
			 pro_t3='2' pro_t4='5'/>
		<z:row pro_numpro='3743' pro_nom='CHAMPIGNONS A LA GRECQUE' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='3742' pro_nom='CHAIR A HACHIS CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3741' pro_nom='CERVELLE DE VEAU CRUE (D)' pro_critere='B16' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='3740' pro_nom='CERVELLE DE PORC CRUE (D)' pro_critere='B16' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='3739' pro_nom='CERVELLE DE BOEUF CRUE (D)' pro_critere='B16' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='3738' pro_nom='CERVELLE D&#x27;AGNEAU CRUE (D)' pro_critere='B16' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='3'/>
		<z:row pro_numpro='3737' pro_nom='CERVELLE POCHÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='3736' pro_nom='CERVELAS CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='3735' pro_nom='CERVELAS CUIT (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='3734' pro_nom='CERVELAS CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='3733' pro_nom='CÉLERI RÉMOULADE' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='3732' pro_nom='CÉLERI RAPÉ ASSAISONNÉ' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3731' pro_nom='CÉLERI CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='3730' pro_nom='CÉLERI BRANCHE MAYONNAISE' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3729' pro_nom='CÉLERI BRANCHE NON ASSAISONNÉ' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='5'/>
		<z:row pro_numpro='3728' pro_nom='CÉLERI BRANCHE ASSAISONNÉ' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3727' pro_nom='CASSOULET CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='3726' pro_nom='CASSOULET SOUS VIDE' pro_critere='A5' pro_t1='0' pro_t2='9' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='3725' pro_nom='CARRÉ DE PORC FUMÉ CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='3724' pro_nom='CARRÉ DE PORC CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='3723' pro_nom='CARRÉ D&#x27;AGNEAU CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3722' pro_nom='CAROTTES RAPÉES MAYONNAISE' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3721' pro_nom='CAROTTES RAPÉES ASSAISONNÉES' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3720' pro_nom='CAROTTES RAPÉES 4G (F)' pro_critere='X1' pro_t1='0' pro_t2='4' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='3719' pro_nom='CAROTTES ENTIERES ÉPLUCHÉES' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='5'/>
		<z:row pro_numpro='3718' pro_nom='CAROTTES CUISINÉES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='3717' pro_nom='CARBONADE DE BOEUF CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='3716' pro_nom='CAPPELLETIS AVEC FROMAGE CUISINÉS' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='8' pro_t4='4'/>
		<z:row pro_numpro='3715' pro_nom='CANARD ROTI' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='3714' pro_nom='CANARD CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='3713' pro_nom='CANARD CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='3712' pro_nom='CANAPÉ A LA CHARCUTERIE CUITE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='3'/>
		<z:row pro_numpro='3711' pro_nom='CAMEMBERT AU LAIT PASTEURISÉ' pro_critere='O7' pro_t1='0' pro_t2='6' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='3710' pro_nom='CALAMAR SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='3709' pro_nom='CALAMARS CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='3708' pro_nom='CAKE AU JAMBON CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='4'/>
		<z:row pro_numpro='3707' pro_nom='CAKE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3706' pro_nom='CAILLETTE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='3705' pro_nom='CAILLETTE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='3704' pro_nom='CAILLETTE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='3703' pro_nom='CAILLE ROTIE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='3702' pro_nom='CAILLE PAC CRUE' pro_critere='F5' pro_t1='0' pro_t2='2' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='3701' pro_nom='CAFÉ CHAUD' pro_critere='A1' pro_t1='0' pro_t2='11' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3700' pro_nom='TRANCHE DE CABILLAUD SURGELÉE' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3699' pro_nom='TRANCHE DE CABILLAUD PANÉE SURGELÉE' pro_critere='H2' pro_t1='0' pro_t2='3'
			 pro_t3='3' pro_t4='4'/>
		<z:row pro_numpro='3698' pro_nom='DARNE DE CABILLAUD FRAICHE' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3697' pro_nom='CABILLAUD CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='3696' pro_nom='BUCHETTE JAMBON EN GELÉE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3695' pro_nom='BUCHETTE CREME AU BEURRE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3694' pro_nom='BUCHE MACÉDOINE JAMBON EN GELÉE' pro_critere='A5' pro_t1='0' pro_t2='8'
			 pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3693' pro_nom='BROCHETTE DE VOLAILLE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3692' pro_nom='BROCHETTE DE VOLAILLE CRUE' pro_critere='F10' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3691' pro_nom='BROCHETTE DE VIANDE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3690' pro_nom='BROCHETTE DE SAUCISSE CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='3689' pro_nom='BROCHETTE DE PORC CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='3688' pro_nom='BROCHETTE DE POISSON PANÉ CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='3687' pro_nom='BROCHETTE DE POISSON SURGELÉE' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3686' pro_nom='BROCHETTE DE POISSON GRILLÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='3685' pro_nom='BROCHETTE DE PETITS BOUDINS CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='6' pro_t4='2'/>
		<z:row pro_numpro='3684' pro_nom='BROCHETTE DE DINDONNEAU CRUE' pro_critere='F10' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3683' pro_nom='BROCHETTE D&#x27;AGNEAU CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3682' pro_nom='BROCHETTE D&#x27;ABATS CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3681' pro_nom='BROCHETTE D&#x27;ABATS D&#x27;ANIMAUX DE BOUCHERIE CRUE' pro_critere='F10'
			 pro_t1='0' pro_t2='1' pro_t3='4' pro_t4='3'/>
		<z:row pro_numpro='3680' pro_nom='BROCOLIS CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='3679' pro_nom='BRIOCHE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='3678' pro_nom='BRANDADE DE MORUE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='3677' pro_nom='BOULETTES DE VIANDE CUISINÉES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='3676' pro_nom='BOUILLON DE CUISSON' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='3675' pro_nom='BOUDIN NOIR CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6' pro_t4='2'/>
		<z:row pro_numpro='3674' pro_nom='BOUDIN NOIR (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='16' pro_t4='1'/>
		<z:row pro_numpro='3673' pro_nom='BOUDIN NOIR (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='16' pro_t4='1'/>
		<z:row pro_numpro='3672' pro_nom='BOUDIN DE POISSON' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='19' pro_t4='1'/>
		<z:row pro_numpro='3671' pro_nom='BOUDIN BLANC CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6' pro_t4='2'/>
		<z:row pro_numpro='3670' pro_nom='BOUDIN BLANC (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='17' pro_t4='1'/>
		<z:row pro_numpro='3669' pro_nom='BOUDIN BLANC (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='17' pro_t4='1'/>
		<z:row pro_numpro='3668' pro_nom='BOUDIN ANTILLAIS (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='16' pro_t4='1'/>
		<z:row pro_numpro='3667' pro_nom='BOUCHÉE FINANCIERE CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='3666' pro_nom='BOUCHÉE AUX FRUITS DE MER CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='3'/>
		<z:row pro_numpro='3665' pro_nom='BOUCHÉE A LA REINE CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='3664' pro_nom='BOEUF EN DAUBE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='3663' pro_nom='BOEUF BOUILLI' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='3662' pro_nom='BOEUF BRAISÉ CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='3661' pro_nom='BOEUF BOURGUIGNON CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='3660' pro_nom='BLETTES CUISINÉES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='3659' pro_nom='BLANQUETTE DE VEAU CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='3658' pro_nom='BLANQUETTE DE PORC CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='3657' pro_nom='BLANC EN NEIGE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='3656' pro_nom='BLANC DE VOLAILLE FARCI CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='2'/>
		<z:row pro_numpro='3655' pro_nom='BLANC DE VOLAILLE POCHÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='3654' pro_nom='BLANC DE SEICHE CRU' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='3653' pro_nom='BLANC DE SEICHE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='3652' pro_nom='BLANC DE POULET TRAITÉ EN SALAISON CUIT (D)' pro_critere='A5' pro_t1='0'
			 pro_t2='5' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3651' pro_nom='BICHERMUESLI' pro_critere='X6' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='3650' pro_nom='BIGORNEAUX' pro_critere='K1' pro_t1='0' pro_t2='3' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='3649' pro_nom='BIFTECK DE CHEVAL CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='5'/>
		<z:row pro_numpro='3648' pro_nom='BIFTECK DE BOEUF CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3647' pro_nom='BIFTECK DE BOEUF CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='3646' pro_nom='BEURRE PASTEURISÉ' pro_critere='Q1' pro_t1='0' pro_t2='6' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='3645' pro_nom='BETTERAVES ROUGES CUITES NON ASSAISONNÉES' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='3644' pro_nom='BETTERAVES ROUGES CUITES ASSAISONNÉES' pro_critere='X6' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='3643' pro_nom='BEIGNET DE CALAMARS CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='3'/>
		<z:row pro_numpro='3642' pro_nom='BEIGNET AUX FRUITS CUITS' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='3641' pro_nom='BEIGNET DE VIANDE CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3640' pro_nom='BEIGNET DE POISSON CRU' pro_critere='J4' pro_t1='0' pro_t2='8' pro_t3='6'
			 pro_t4='5'/>
		<z:row pro_numpro='3639' pro_nom='BEIGNET DE POISSON CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='3'/>
		<z:row pro_numpro='3638' pro_nom='BEIGNET DE CREVETTES CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='3'/>
		<z:row pro_numpro='3637' pro_nom='BEIGNET CREME CHANTILLY S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3636' pro_nom='BAVETTE D&#x27;ALOYAU CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3635' pro_nom='BAVETTE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='3634' pro_nom='BAVAROIS S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3633' pro_nom='BAVAROIS CREME CHANTILLY P' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='3632' pro_nom='BAVAROIS (D)' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3631' pro_nom='BAVAROIS CREME CHANTILLY M' pro_critere='P3' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='3'/>
		<z:row pro_numpro='3630' pro_nom='BARQUETTE AUX MARRONS' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='3629' pro_nom='BANANE CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='3628' pro_nom='BANANE CHANTILLY S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3627' pro_nom='BALLOTTINE DE VOLAILLE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='12'
			 pro_t4='1'/>
		<z:row pro_numpro='3626' pro_nom='BALLOTTINE DE VOLAILLE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='12'
			 pro_t4='1'/>
		<z:row pro_numpro='3625' pro_nom='BALLOTTINE AUX OLIVES (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='12'
			 pro_t4='1'/>
		<z:row pro_numpro='3624' pro_nom='BALLOTTINE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='12' pro_t4='1'/>
		<z:row pro_numpro='3623' pro_nom='BALLOTTINE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='12' pro_t4='1'/>
		<z:row pro_numpro='3622' pro_nom='BACON' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3621' pro_nom='BABA CREME PATISSIERE ET FRUITS FRAIS' pro_critere='P1' pro_t1='0' pro_t2='10'
			 pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='3620' pro_nom='BABA CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3619' pro_nom='BABA CREME CHANTILLY (D)' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3618' pro_nom='BABA CHANTILLY S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3617' pro_nom='BABA CHANTILLY P' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='3616' pro_nom='BABA CHANTILLY M' pro_critere='P3' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='3615' pro_nom='BABA AUX FRUITS' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='3614' pro_nom='AVOCAT ASSAISONNÉ' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='3613' pro_nom='BOEUF BOURGUIGNON CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3612' pro_nom='ASPIC OEUF TOMATE' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3611' pro_nom='ASPIC OEUF JAMBON CUIT' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3610' pro_nom='ASPIC OEUF CREVETTE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3609' pro_nom='ASPIC MOUSSE DE SAUMON' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3608' pro_nom='ASPIC MOUSSE DE FOIE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3607' pro_nom='ASPERGES CUITES ASSAISONNÉES' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='3606' pro_nom='ASPERGES CUITES NON ASSAISONNÉES' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='3605' pro_nom='ARTICHAUTS CUITS NON ASSAISONNÉS' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='3604' pro_nom='APPAREIL AU FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='3603' pro_nom='APPAREIL AUX FRUITS DE MER CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='3602' pro_nom='APPAREIL A BOUCHÉE A LA REINE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='3601' pro_nom='ANDOUILLETTE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='2'/>
		<z:row pro_numpro='3600' pro_nom='ANDOUILLETTE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='15' pro_t4='1'/>
		<z:row pro_numpro='3599' pro_nom='ANDOUILLETTE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='15' pro_t4='1'/>
		<z:row pro_numpro='3598' pro_nom='ANDOUILLE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='15' pro_t4='1'/>
		<z:row pro_numpro='3597' pro_nom='ANDOUILLE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='15' pro_t4='1'/>
		<z:row pro_numpro='3596' pro_nom='AMANDINE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3595' pro_nom='AMANDES' pro_critere='K1' pro_t1='0' pro_t2='3' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='3594' pro_nom='ALOUETTE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='3593' pro_nom='ALLUMETTE AU FROMAGE CUITE' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='3592' pro_nom='AILERON DE DINDE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='3591' pro_nom='AILE DE POULET CRUE' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='3590' pro_nom='AIGUILLETTE DE CANARD CRUE' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3589' pro_nom='AGNEAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='4'/>
		<z:row pro_numpro='3588' pro_nom='ABATS DE VOLAILLE CRUS' pro_critere='F6' pro_t1='0' pro_t2='2' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='3587' pro_nom='COU DE VOLAILLE FARCI CONFIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='9'
			 pro_t4='2'/>
		<z:row pro_numpro='3586' pro_nom='MIXÉ DÉSHYDRATÉ' pro_critere='A1' pro_t1='0' pro_t2='12' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='3585' pro_nom='VIANDE HACHÉE DE VEAU AU FROMAGE CUITE' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3584' pro_nom='ROULADE DE BOEUF FARCIE CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='3583' pro_nom='TAGLIATELLES AU FROMAGE CUISINÉES' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='8' pro_t4='5'/>
		<z:row pro_numpro='3582' pro_nom='GELÉE AUX FRUITS DÉSHYDRATÉE' pro_critere='A1' pro_t1='0' pro_t2='12' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='3581' pro_nom='BLANC DE DINDE CUIT FROID' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='9'
			 pro_t4='3'/>
		<z:row pro_numpro='3580' pro_nom='ROULADE DE SAUMON' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='19' pro_t4='1'/>
		<z:row pro_numpro='3579' pro_nom='TERRINE DE RIS DE VEAU (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='3578' pro_nom='BROCOLIS SURGELÉS' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3577' pro_nom='ROULADE DE VEAU (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='12' pro_t4='1'/>
		<z:row pro_numpro='3576' pro_nom='PRÉP. A BASE DE CHAIR DE CRUSTACÉ HACHÉE CUITE SURGELÉE' pro_critere='A1'
			 pro_t1='0' pro_t2='3' pro_t3='7' pro_t4='4'/>
		<z:row pro_numpro='3575' pro_nom='GRUYERE AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='3574' pro_nom='CERISE DE BOEUF CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='3573' pro_nom='CERVELAS CUIT AU BACON' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='22'
			 pro_t4='1'/>
		<z:row pro_numpro='3572' pro_nom='ASPIC OEUF MACÉDOINE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3571' pro_nom='ABVT1 TRANCHE DE TRUITE' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='3570' pro_nom='FILET DE HARENG CUIT EN SALADE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='13'/>
		<z:row pro_numpro='3569' pro_nom='PONT L&#x27;EVEQUE AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='3568' pro_nom='CHAMPIGNONS CRUS A LA CREME' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3567' pro_nom='GIBIER A POILS ENTIER CRU' pro_critere='D2' pro_t1='0' pro_t2='2' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='3566' pro_nom='SALADE CUIDITÉS CRUDITÉS AU SALAMI' pro_critere='X28' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='11'/>
		<z:row pro_numpro='3565' pro_nom='RACLETTE AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='3564' pro_nom='APPAREIL A L&#x27;OEUF POUR TARTE' pro_critere='A5' pro_t1='0' pro_t2='10'
			 pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='3563' pro_nom='OIGNONS ÉMINCÉS' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='2' pro_t4='5'/>
		<z:row pro_numpro='3562' pro_nom='PICODON AU LAIT PASTEURISÉ' pro_critere='O7' pro_t1='0' pro_t2='6' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='3561' pro_nom='FLEISCHSCHNAKA AU FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='3560' pro_nom='ESCALOPE DE DINDONNEAU PANÉE AVEC FROMAGE PRÉCUITE' pro_critere='F10' pro_t1='0'
			 pro_t2='9' pro_t3='3' pro_t4='5'/>
		<z:row pro_numpro='3559' pro_nom='CREME CITRON' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='3558' pro_nom='TOURTE CRUE AUX CHAMPIGNONS' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='3557' pro_nom='DESSERT BANANE CUIT' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='8' pro_t4='4'/>
		<z:row pro_numpro='3556' pro_nom='PAUPIETTE DE POISSON CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='3555' pro_nom='OEUF EN BARRE' pro_critere='A1' pro_t1='0' pro_t2='7' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3554' pro_nom='SAUCISSE FUMÉE CUITE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='3553' pro_nom='LIVAROT AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='3552' pro_nom='POLENTA AU FROMAGE CUISINÉE' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='3'/>
		<z:row pro_numpro='3551' pro_nom='QUICHE AUX FRUITS DE MER CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='8'/>
		<z:row pro_numpro='3550' pro_nom='SALADE VERTE ET OEUF DUR NON ASSAISONNÉS' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='15'/>
		<z:row pro_numpro='3549' pro_nom='AUBERGINES AU FROMAGE CUISINÉES' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='2'/>
		<z:row pro_numpro='3548' pro_nom='MINI PAIN AUX RAISINS CRU' pro_critere='A6' pro_t1='0' pro_t2='8' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='3547' pro_nom='VIANDE HACHÉE DE PORC CRUE PANÉE TRAITÉE SALAISON' pro_critere='F4' pro_t1='0'
			 pro_t2='5' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='3546' pro_nom='POITRINE DE PORC CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='3545' pro_nom='VIANDE DE LAPIN EN GELÉE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3544' pro_nom='AILE DE POULET FARCIE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3543' pro_nom='NEUFCHATEL AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='3542' pro_nom='POITRINE DE VEAU CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='3541' pro_nom='BIGORNEAUX CUITS' pro_critere='I2' pro_t1='0' pro_t2='3' pro_t3='7' pro_t4='3'/>
		<z:row pro_numpro='3540' pro_nom='CERVELLE DE BOEUF CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3539' pro_nom='NOUGAT' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='3538' pro_nom='HARENG FUMÉ' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='3537' pro_nom='CABRI CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='3536' pro_nom='LANGUE DE BOEUF CRUE (D)' pro_critere='B16' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='3535' pro_nom='TRESSE AU LAIT PASTEURISÉ' pro_critere='O7' pro_t1='0' pro_t2='6' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='3534' pro_nom='CHAIR DE CRABE CRUE' pro_critere='I8' pro_t1='0' pro_t2='3' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='3533' pro_nom='JAUNE D&#x27;OEUF NON PASTEURISÉ' pro_critere='R1' pro_t1='0' pro_t2='7'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3532' pro_nom='ROUSSETTE POCHÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='3531' pro_nom='FLORENTIN CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3530' pro_nom='JOUE DE BOEUF CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3529' pro_nom='FEUILLETÉ CRU AUX CHAMPIGNONS' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='6'
			 pro_t4='9'/>
		<z:row pro_numpro='3528' pro_nom='POITRINE D&#x27;AGNEAU CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='3527' pro_nom='PALETTE DE PORC CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='3526' pro_nom='PALETTE DE PORC CUITE FROIDE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='9'
			 pro_t4='2'/>
		<z:row pro_numpro='3525' pro_nom='CROISSANT A LA VIANDE CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='4'/>
		<z:row pro_numpro='3524' pro_nom='SANDWICH AU POISSON CUIT' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='4'/>
		<z:row pro_numpro='3523' pro_nom='ABVT1 CABILLAUD' pro_critere='V12' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='3522' pro_nom='ANDOUILLE A CUIRE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='3521' pro_nom='AVOCAT ET SURIMI MAYONNAISE' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='13'/>
		<z:row pro_numpro='3520' pro_nom='POUDRE DE CACAO' pro_critere='P1' pro_t1='0' pro_t2='12' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='3519' pro_nom='SANDWICH AUX CUIDITÉS' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='7'/>
		<z:row pro_numpro='3518' pro_nom='SAUCE TOMATE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='9' pro_t4='4'/>
		<z:row pro_numpro='3517' pro_nom='TETE ROULÉE EN SALADE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='12'/>
		<z:row pro_numpro='3516' pro_nom='PIED DE PORC VINAIGRETTE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='12'/>
		<z:row pro_numpro='3515' pro_nom='CONCOMBRE ASSAISONNÉ' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='3514' pro_nom='GÉNOISE CREME MOUSSELINE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='3513' pro_nom='HACHÉ DE VOLAILLE CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='3'/>
		<z:row pro_numpro='3512' pro_nom='POISSON FARCI CUIT FROID' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='3511' pro_nom='CRUDITÉS ET THON EN SALADE' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='14'/>
		<z:row pro_numpro='3510' pro_nom='FILET DE POULET CUIT FROID' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='9'
			 pro_t4='3'/>
		<z:row pro_numpro='3509' pro_nom='HAMPE DE VEAU CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='3508' pro_nom='ESCALOPE DE VEAU PANÉE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='3507' pro_nom='SANDWICH CRUDITÉS ET SAUMON CUIT' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='3' pro_t4='7'/>
		<z:row pro_numpro='3506' pro_nom='FROMAGE BLANC FAISSELLE (F)' pro_critere='O11' pro_t1='0' pro_t2='6' pro_t3='6'
			 pro_t4='2'/>
		<z:row pro_numpro='3505' pro_nom='CREVETTES CRUES DÉCORTIQUÉES CONGELÉES (D)' pro_critere='I8' pro_t1='0'
			 pro_t2='3' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='3504' pro_nom='TARTE AUX POIREAUX ET FROMAGE CUITE' pro_critere='Z5' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='8'/>
		<z:row pro_numpro='3503' pro_nom='SAMOUSSAS CRUS' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='6' pro_t4='6'/>
		<z:row pro_numpro='3502' pro_nom='ROUX' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='9' pro_t4='2'/>
		<z:row pro_numpro='3501' pro_nom='OSSAU IRATY AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='9'
			 pro_t4='1'/>
		<z:row pro_numpro='3500' pro_nom='RAVIOLIS FRITS' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='6'/>
		<z:row pro_numpro='3499' pro_nom='SAUCE CREME FRAICHE M' pro_critere='P3' pro_t1='0' pro_t2='10' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='3498' pro_nom='POITRINE PERSILLÉE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='22'
			 pro_t4='3'/>
		<z:row pro_numpro='3497' pro_nom='PAUPIETTE DE SOLE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='3496' pro_nom='RIZ ET KAMABOKO EN SALADE' pro_critere='X22' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='9'/>
		<z:row pro_numpro='3495' pro_nom='BROCHETTE DE VIANDE HACHÉE CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='3494' pro_nom='AIGUILLETTE BARONNE DE VEAU CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='3493' pro_nom='TARTE A LA CREME DE MARRONS' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='3492' pro_nom='CREVETTES FRITES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='3'/>
		<z:row pro_numpro='3491' pro_nom='TARTIFLETTE AVEC FROMAGE CUITE' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='3490' pro_nom='ROULEAUX MEXICAINS CUITS' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='6'/>
		<z:row pro_numpro='3489' pro_nom='GRILLE AUX FRUITS CUIT' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='3488' pro_nom='RIZ ET POISSON NON ASSAISONNÉS' pro_critere='X22' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='8'/>
		<z:row pro_numpro='3487' pro_nom='PAVÉ AUX FRUITS' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='4'/>
		<z:row pro_numpro='3486' pro_nom='TARTELETTE CREME MOUSSELINE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='3485' pro_nom='NEMS CRUS' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='6' pro_t4='6'/>
		<z:row pro_numpro='3484' pro_nom='ROULÉ AU CHOCOLAT' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3483' pro_nom='TARAMA' pro_critere='A8' pro_t1='0' pro_t2='3' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='3482' pro_nom='CORNET CREME MOUSSELINE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='3481' pro_nom='LORRAIN CREME MOUSSELINE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='3480' pro_nom='DARNE DE SAUMON FRAICHE' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3479' pro_nom='MELONA (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='3478' pro_nom='SALADE COMPOSÉE RIZ THON ET OEUF' pro_critere='X22' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='4'/>
		<z:row pro_numpro='3477' pro_nom='SAUTÉ DE LAPIN CRU' pro_critere='F17' pro_t1='0' pro_t2='2' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3476' pro_nom='DESSUS DE TRANCHE DE BOEUF CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3475' pro_nom='APPAREIL SAUCE FROMAGE BLANC' pro_critere='A5' pro_t1='0' pro_t2='10' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='3474' pro_nom='APPAREIL SAUCE CITRON' pro_critere='A5' pro_t1='0' pro_t2='10' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='3473' pro_nom='APPAREIL SAUCE NORMANDE' pro_critere='A5' pro_t1='0' pro_t2='10' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='3472' pro_nom='TARTE AUX ÉPINARDS CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='8'/>
		<z:row pro_numpro='3471' pro_nom='PRÉPARATION HACHÉE DE BOEUF CRUE' pro_critere='B1' pro_t1='0' pro_t2='1'
			 pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='3470' pro_nom='MÉLANGE CUIDITÉS CRUDITÉS ET MAGRET FUMÉ NON ASSAISONNÉS' pro_critere='X24'
			 pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='11'/>
		<z:row pro_numpro='3469' pro_nom='TARTE AU JAMBON CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='8'/>
		<z:row pro_numpro='3468' pro_nom='COEURS DE VOLAILLE CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='3467' pro_nom='FRUITS DÉCONGELÉS' pro_critere='X3' pro_t1='0' pro_t2='10' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='3466' pro_nom='ÉCHINE DE PORC CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='3465' pro_nom='BLANC D&#x27;ENCORNET SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='3464' pro_nom='APPAREIL A TUILE' pro_critere='A5' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='3463' pro_nom='ACRAS CRUS DE POISSON CRU' pro_critere='J4' pro_t1='0' pro_t2='8' pro_t3='6'
			 pro_t4='6'/>
		<z:row pro_numpro='3462' pro_nom='GAMBAS FARCIES CUITES' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='6'/>
		<z:row pro_numpro='3461' pro_nom='ABVT1 FILET DE ROUGET' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='3460' pro_nom='BOISSON LACTÉE FERMENTÉE AU LAIT PASTEURISÉ' pro_critere='O2' pro_t1='0'
			 pro_t2='6' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='3459' pro_nom='SEMOULE EN SALADE' pro_critere='X4' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='9'/>
		<z:row pro_numpro='3458' pro_nom='NEM PRÉCUIT' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='6'/>
		<z:row pro_numpro='3457' pro_nom='POITRINE DE PORC SAUMURÉE CRUE' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3456' pro_nom='JUS DE FRUITS STÉRILISÉ' pro_critere='A1' pro_t1='0' pro_t2='11' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3455' pro_nom='VERMICELLES DE SOJA' pro_critere='A1' pro_t1='0' pro_t2='13' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='3454' pro_nom='POISSON CRU NON ASSAISONNÉ' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3453' pro_nom='TENDE DE TRANCHE DE BOEUF CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3452' pro_nom='BATAVIA' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='3451' pro_nom='ROND DE GITE CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3450' pro_nom='PICODON AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='3449' pro_nom='MARINADE DE FRUITS DE MER CUITS' pro_critere='A1' pro_t1='0' pro_t2='3' pro_t3='6'
			 pro_t4='4'/>
		<z:row pro_numpro='3448' pro_nom='OIGNONS ÉMINCÉS SURGELÉS' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3447' pro_nom='RISSOLETTE DE VEAU PANÉE PRÉCUITE' pro_critere='B1' pro_t1='0' pro_t2='9'
			 pro_t3='4' pro_t4='3'/>
		<z:row pro_numpro='3446' pro_nom='ABVT1 ÉPERLAN' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='3445' pro_nom='PIZZA CRUE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='6' pro_t4='7'/>
		<z:row pro_numpro='3444' pro_nom='GATEAU DE TAPIOCA' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3443' pro_nom='CUISSE DE VOLAILLE FARCIE CRUE' pro_critere='F10' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='3442' pro_nom='BROCHETTE D&#x27;ANDOUILLETTE (D)' pro_critere='A5' pro_t1='0' pro_t2='5'
			 pro_t3='15' pro_t4='2'/>
		<z:row pro_numpro='3441' pro_nom='VIENNOIS BÉCHAMEL FROMAGE A CUIRE' pro_critere='A5' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='3440' pro_nom='POMMES DE TERRE FRITES CRUES SURGELÉES' pro_critere='U2' pro_t1='0' pro_t2='4'
			 pro_t3='3' pro_t4='3'/>
		<z:row pro_numpro='3439' pro_nom='FROMAGE A PATE PRESSÉE NC DE BREBIS AU LAIT PAST' pro_critere='P5' pro_t1='0'
			 pro_t2='6' pro_t3='9' pro_t4='2'/>
		<z:row pro_numpro='3438' pro_nom='VINAIGRE AU GINGEMBRE' pro_critere='A1' pro_t1='0' pro_t2='13' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3437' pro_nom='CONCOMBRE ENTIER ÉPLUCHÉ 4G (D)' pro_critere='X3' pro_t1='0' pro_t2='4'
			 pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='3436' pro_nom='GALETTE HOLLANDAISE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3435' pro_nom='AVOCAT AU THON MAYONNAISE' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='13'/>
		<z:row pro_numpro='3434' pro_nom='FILET DE MÉROU CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='3433' pro_nom='TELLINES CUITES ASSAISONNÉES' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='3432' pro_nom='COEUR DE CÉLERI CUIT NON ASSAISONNÉ' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='3431' pro_nom='RONDELLES DE POIREAUX SURGELÉS' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3430' pro_nom='CONFIT DE FOIE DE CANARD (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='9'
			 pro_t4='1'/>
		<z:row pro_numpro='3429' pro_nom='PATE A BEIGNET CRUE' pro_critere='A6' pro_t1='0' pro_t2='8' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='3428' pro_nom='SAUTÉ DE LAPIN CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='3427' pro_nom='ASPIC OEUF CAROTTES RAPÉES' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3426' pro_nom='CRÉPINETTE DE LAPIN CUITE' pro_critere='A2' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='4'/>
		<z:row pro_numpro='3425' pro_nom='ROTI DE VEAU FARCI CRU' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='3424' pro_nom='LANGRES AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='3423' pro_nom='MANCHON DE POULET CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='3422' pro_nom='MERGUEZ PRÉCUITE' pro_critere='F4' pro_t1='0' pro_t2='9' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='3421' pro_nom='COQ CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='3420' pro_nom='POISSON CUIT NON ASSAISONNÉ' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='13'/>
		<z:row pro_numpro='3419' pro_nom='HAUT DE CUISSE DE DINDE CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3418' pro_nom='TARTE AUX PRALINES' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3417' pro_nom='GIGOLETTE D&#x27;AGNEAU CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3416' pro_nom='RILLETTES D&#x27;ARTICHAUTS (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='20'
			 pro_t4='1'/>
		<z:row pro_numpro='3415' pro_nom='SAINT MARCELLIN AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='3414' pro_nom='POIREAUX CRUS SURGELÉS' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='3413' pro_nom='PRÉPARATION AU FROMAGE CUITE' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='3412' pro_nom='FILET DE TACAUD SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3411' pro_nom='PINCE DE CRABE CUITE' pro_critere='A1' pro_t1='0' pro_t2='3' pro_t3='7' pro_t4='3'/>
		<z:row pro_numpro='3410' pro_nom='ROTI DE PORC CUIT AVEC FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='5'/>
		<z:row pro_numpro='3409' pro_nom='PIED DE VEAU CUIT EN SALADE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='11'/>
		<z:row pro_numpro='3408' pro_nom='JAMBON EN CROUTE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3407' pro_nom='GATEAU CREME CITRON MERINGUÉE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='3406' pro_nom='COURGETTE RAPÉE MAYONNAISE' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3405' pro_nom='LAIT CRU BOUILLI' pro_critere='N11' pro_t1='0' pro_t2='6' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='3404' pro_nom='BROCHETTE DE VOLAILLE AVEC FROMAGE CUITE' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='3403' pro_nom='TABOULÉ AUX FRUITS' pro_critere='X4' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='3402' pro_nom='FEUILLETÉ AU JAMBON CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='3401' pro_nom='ROGNONS D&#x27;AGNEAU CRUS (F)' pro_critere='B15' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='3'/>
		<z:row pro_numpro='3400' pro_nom='ESCALOPE DE DINDE PRÉCUITE' pro_critere='F17' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='3'/>
		<z:row pro_numpro='3399' pro_nom='CHEESEBURGER CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3398' pro_nom='DIOT BLANC (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='14' pro_t4='2'/>
		<z:row pro_numpro='3397' pro_nom='FARCE A NEM CRUE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='6' pro_t4='6'/>
		<z:row pro_numpro='3396' pro_nom='HOT MERGUEZ CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='4'/>
		<z:row pro_numpro='3395' pro_nom='VIANDE HACHÉE DE DINDONNEAU CUITE' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='4' pro_t4='4'/>
		<z:row pro_numpro='3394' pro_nom='FILET DE ROUGET FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='3393' pro_nom='MACREUSE DE BOEUF CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3392' pro_nom='ENCORNET FARCI CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='3391' pro_nom='CAKE A LA CREME ANGLAISE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3390' pro_nom='CREPE NATURE CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='9'/>
		<z:row pro_numpro='3389' pro_nom='PATE A CREPE CRUE' pro_critere='A6' pro_t1='0' pro_t2='8' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='3388' pro_nom='TARTE FLAMBÉE AVEC FROMAGE CUITE' pro_critere='Z5' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='9'/>
		<z:row pro_numpro='3387' pro_nom='ROTI DE SANGLIER SAUMURÉ CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3386' pro_nom='CHAMPIGNONS A LA CREME CUITS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='2'/>
		<z:row pro_numpro='3385' pro_nom='ABVT1 MERLUCHON' pro_critere='V12' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='3384' pro_nom='DOUGHNUT' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3383' pro_nom='MIXÉ DE VIANDE AVEC FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3382' pro_nom='LÉGUMES 4G (F)' pro_critere='X1' pro_t1='0' pro_t2='4' pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='3381' pro_nom='VIENNOISERIE CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3380' pro_nom='BRIE DE MELUN AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='3379' pro_nom='ABVT1 TRANCHE D&#x27;ESPADON' pro_critere='V15' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='3378' pro_nom='GATEAU MOELLEUX AU CHOCOLAT' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='3377' pro_nom='TARTE VERGEOISE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3376' pro_nom='AILERON DE VOLAILLE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='3375' pro_nom='SALADE CUIDITÉS CRUDITÉS ET OEUFS DURS' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='15'/>
		<z:row pro_numpro='3374' pro_nom='ABVT1 FILET DE CARDINAL' pro_critere='V1' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='3373' pro_nom='MACARON CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3372' pro_nom='AIGUILLETTE DE POULET CRUE' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3371' pro_nom='BEIGNET DE CRABE CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='6'/>
		<z:row pro_numpro='3370' pro_nom='FEUILLETÉ AU FROMAGE PRÉCUIT' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='3369' pro_nom='ÉMINCÉ DE POISSON CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='3368' pro_nom='GITE DE CHEVAL CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='5'/>
		<z:row pro_numpro='3367' pro_nom='ABVT1 ANCHOIS' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='3366' pro_nom='SANDWICH JAMBON CUIT ET SAUCISSON SEC' pro_critere='G1' pro_t1='0' pro_t2='8'
			 pro_t3='3' pro_t4='7'/>
		<z:row pro_numpro='3365' pro_nom='CREME STÉRILISÉE AUX FINES HERBES &#x22;MAISON&#x22;' pro_critere='A5' pro_t1='0'
			 pro_t2='8' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='3364' pro_nom='ABVT4 POULPE' pro_critere='V4' pro_t1='0' pro_t2='3' pro_t3='6' pro_t4='2'/>
		<z:row pro_numpro='3363' pro_nom='CREPE JAMBON CUITE ET FROMAGE A CUIRE' pro_critere='A5' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='2'/>
		<z:row pro_numpro='3362' pro_nom='SAUMON EN TRANCHE CUIT FARCI' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='19'
			 pro_t4='1'/>
		<z:row pro_numpro='3361' pro_nom='COQUILLE AU SAUMON MAYONNAISE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='6'/>
		<z:row pro_numpro='3360' pro_nom='FLAN AU ROQUEFORT CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='3359' pro_nom='BOUCHÉE AU JAMBON CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='3358' pro_nom='FEUILLETÉ JAMBON TOMATES CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='3357' pro_nom='TARTELETTE CREME D&#x27;AMANDE CUITE' pro_critere='A1' pro_t1='0' pro_t2='10'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3356' pro_nom='TRANCHE DE GIGOT D&#x27;AGNEAU CRUE' pro_critere='B2' pro_t1='0' pro_t2='1'
			 pro_t3='2' pro_t4='4'/>
		<z:row pro_numpro='3355' pro_nom='PALERON CUIT FROID' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='3354' pro_nom='FILET DE SAUMON FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='3353' pro_nom='FEUILLETÉ A LA CONFITURE CUIT' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='3352' pro_nom='CUIDITÉS CRUDITÉS ET KAMABOKO NON ASSAISONNÉS' pro_critere='X24' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='13'/>
		<z:row pro_numpro='3351' pro_nom='CORDON BLEU DE DINDONNEAU PRÉCUIT' pro_critere='F10' pro_t1='0' pro_t2='2'
			 pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='3350' pro_nom='PLAT DE COTE DE BOEUF CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3349' pro_nom='BUCHETTE FERMIERE AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='3348' pro_nom='GORGE DE PORC CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='3347' pro_nom='FEUILLETÉ VOLAILLE FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='4'/>
		<z:row pro_numpro='3346' pro_nom='BRIOCHE FOURRÉE AU SAUCISSON (D)' pro_critere='A5' pro_t1='0' pro_t2='5'
			 pro_t3='13' pro_t4='2'/>
		<z:row pro_numpro='3345' pro_nom='ÉPAULE DE BOEUF CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3344' pro_nom='CUISSOT DE VEAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='3343' pro_nom='SANDWICH AU THON' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='3' pro_t4='4'/>
		<z:row pro_numpro='3342' pro_nom='CARRÉ DE BOEUF CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3341' pro_nom='CHAUSSON CRU AU THON' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='6' pro_t4='5'/>
		<z:row pro_numpro='3340' pro_nom='AMBASSADEUR CREME AU BEURRE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3339' pro_nom='FOIE DE PORC CRU (F)' pro_critere='B15' pro_t1='0' pro_t2='1' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='3338' pro_nom='RATATOUILLE CUITE NON ASSAISONNÉE' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='3337' pro_nom='GRATIN DE FRUITS' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3336' pro_nom='PATE A CHOUX CRUE' pro_critere='A6' pro_t1='0' pro_t2='8' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='3335' pro_nom='BLOC DE FOIE GRAS (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='21'
			 pro_t4='1'/>
		<z:row pro_numpro='3334' pro_nom='BLOC DE FOIE GRAS (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='21'
			 pro_t4='1'/>
		<z:row pro_numpro='3333' pro_nom='CAVIAR PASTEURISÉ' pro_critere='M1' pro_t1='0' pro_t2='3' pro_t3='11' pro_t4='1'/>
		<z:row pro_numpro='3332' pro_nom='TRANCHE DE VEAU DE MER FRAICHE' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3331' pro_nom='CANAPÉ A L&#x27;OEUF DE CAILLE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='7'/>
		<z:row pro_numpro='3330' pro_nom='SAINT FÉLICIEN AU LAIT PASTEURISÉ' pro_critere='O7' pro_t1='0' pro_t2='6'
			 pro_t3='7' pro_t4='2'/>
		<z:row pro_numpro='3329' pro_nom='BOULETTES DE POISSON PANÉES CUITES' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='3328' pro_nom='FILET MIGNON PANÉ CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='3327' pro_nom='VEAU CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='3326' pro_nom='ASPIC OEUF ET LÉGUMES CUITS' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3325' pro_nom='POMMES DE TERRE ET SAUMON FUMÉ EN SALADE' pro_critere='X22' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='13'/>
		<z:row pro_numpro='3324' pro_nom='VIANDE DE BOEUF EN GELÉE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3323' pro_nom='GRATIN DAUPHINOIS AVEC FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='3322' pro_nom='MÉLANGE CUIDITÉS CRUDITÉS ET THON NON ASSAISONNÉS' pro_critere='X24' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='14'/>
		<z:row pro_numpro='3321' pro_nom='CREME AUX OEUFS' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3320' pro_nom='FROMAGE FRAIS DE BREBIS AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6'
			 pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='3319' pro_nom='BARDE DE PORC CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='3318' pro_nom='GIGOT DE VEAU CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='3317' pro_nom='HURE DE LAPIN (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='22' pro_t4='1'/>
		<z:row pro_numpro='3316' pro_nom='ÉPINARDS CUISINÉS AVEC FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='2'/>
		<z:row pro_numpro='3315' pro_nom='PAVÉ JAMBON FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='2'/>
		<z:row pro_numpro='3314' pro_nom='PURÉE INSTANTANÉE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='3313' pro_nom='BASSE COTE DE BOEUF CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3312' pro_nom='GATEAU AU CHOCOLAT' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3311' pro_nom='RIGATONIS CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='7'/>
		<z:row pro_numpro='3310' pro_nom='CHAOURCE AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='3309' pro_nom='BOUCHON DE SANCERRE AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='3308' pro_nom='MORUE SALÉE' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='3307' pro_nom='ESCALOPE DE VEAU CRUE FOURRÉE AU FROMAGE' pro_critere='F10' pro_t1='0' pro_t2='1'
			 pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='3306' pro_nom='PATES ET VIANDE CUITE EN SALADE' pro_critere='X22' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='9'/>
		<z:row pro_numpro='3305' pro_nom='TAGLIATELLES SAUCE CARBONARA CUISINÉES' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='8' pro_t4='7'/>
		<z:row pro_numpro='3304' pro_nom='QUASI DE VEAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='3303' pro_nom='AIL ÉPLUCHÉ' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='3302' pro_nom='OEUF DUR ET THON MAYONNAISE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='15'/>
		<z:row pro_numpro='3301' pro_nom='POMMES DE TERRE ET ROLLMOPS MAYONNAISE' pro_critere='X22' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='14'/>
		<z:row pro_numpro='3300' pro_nom='CHICKENBURGER PRÉCUIT' pro_critere='F2' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='5'/>
		<z:row pro_numpro='3299' pro_nom='POITRINE DE BOEUF CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3298' pro_nom='ANANAS FRAIS TRANCHÉ' pro_critere='X3' pro_t1='0' pro_t2='10' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='3297' pro_nom='MAGRET DE CANARD SÉCHÉ CRU' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3296' pro_nom='MIXÉ DE DINDE CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4' pro_t4='3'/>
		<z:row pro_numpro='3295' pro_nom='MOULES SEMI CONSERVE' pro_critere='M2' pro_t1='0' pro_t2='3' pro_t3='11' pro_t4='1'/>
		<z:row pro_numpro='3294' pro_nom='TRANCHE DE BOEUF CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3293' pro_nom='TARTE AU SUCRE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3292' pro_nom='ROUELLE D&#x27;AGNEAU CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='3291' pro_nom='GRILLADE DE VEAU CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='3290' pro_nom='BROCHETTE DE BOUDINS (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='16'
			 pro_t4='1'/>
		<z:row pro_numpro='3289' pro_nom='LAIT D&#x27;AMANDE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='3288' pro_nom='ABVT2 FILET DE LIEU' pro_critere='V12' pro_t1='0' pro_t2='3' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='3287' pro_nom='LÉGUMES FARCIS CUITS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3286' pro_nom='TARTE A LA CREME SUCRÉE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='3285' pro_nom='MIXÉ AUX OEUFS CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='3284' pro_nom='FRUITS CUITS AU FROMAGE BLANC' pro_critere='A5' pro_t1='0' pro_t2='10' pro_t3='8'
			 pro_t4='3'/>
		<z:row pro_numpro='3283' pro_nom='CONCOMBRE ET OEUF DUR EN SALADE' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='15'/>
		<z:row pro_numpro='3282' pro_nom='LANGUE D&#x27;AGNEAU CRUE (F)' pro_critere='B15' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='3'/>
		<z:row pro_numpro='3281' pro_nom='ABVT1 FILET D&#x27;ANCHOIS' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='3280' pro_nom='POULET TRAITÉ EN SALAISON FUMÉ CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3279' pro_nom='TARTELETTE AUX FRUITS A CUIRE' pro_critere='A6' pro_t1='0' pro_t2='10' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='3278' pro_nom='PALETTE DE PORC CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='3277' pro_nom='PETIT PAIN TOMATE ET BOEUF CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='7'/>
		<z:row pro_numpro='3276' pro_nom='LÉGUMES CUITS AVEC FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='3'/>
		<z:row pro_numpro='3275' pro_nom='ASPIC OEUF MOUSSE DE CANARD' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3274' pro_nom='SAUMONETTE SURGELÉE' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3273' pro_nom='AIL COUPÉ SURGELÉ' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2' pro_t4='4'/>
		<z:row pro_numpro='3272' pro_nom='SANDWICH AU JAMBON CUIT' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3271' pro_nom='POISSON CUIT FROID' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='3270' pro_nom='ASPIC AU SAUMON CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3269' pro_nom='BROCHETTE DE POULPE MARINÉE' pro_critere='M2' pro_t1='0' pro_t2='3' pro_t3='11'
			 pro_t4='1'/>
		<z:row pro_numpro='3268' pro_nom='CREPE CHAMPIGNONS ET JAMBON CUITE' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='2'/>
		<z:row pro_numpro='3267' pro_nom='APPAREIL A CREME BRULÉE' pro_critere='A5' pro_t1='0' pro_t2='10' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='3266' pro_nom='FARCE POUR ACRAS CRUE' pro_critere='J2' pro_t1='0' pro_t2='3' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3265' pro_nom='CREME CATALANE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3264' pro_nom='TORTELLINIS CUITS AVEC FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='7'/>
		<z:row pro_numpro='3263' pro_nom='CUIDITÉS CRUDITÉS ET JAMBON CRU NON ASSAISONNÉS' pro_critere='X28' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='11'/>
		<z:row pro_numpro='3262' pro_nom='PRÉPARATION AU JAMBON CUIT ET FROMAGE PRÉCUITE' pro_critere='Z5' pro_t1='0'
			 pro_t2='8' pro_t3='7' pro_t4='2'/>
		<z:row pro_numpro='3261' pro_nom='SOJA CUIT ASSAISONNÉ' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='3260' pro_nom='FILET DE LIEU NOIR FUMÉ' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='3259' pro_nom='MERLU PANÉ CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='3258' pro_nom='LONGANISSE' pro_critere='G1' pro_t1='0' pro_t2='5' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='3257' pro_nom='NOUGAT VIETNAMIEN' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='3256' pro_nom='STEAK DE COLIN SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3255' pro_nom='CERISE DE BOEUF CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='3254' pro_nom='POISSON CUIT FROID NON ASSAISONNÉ' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='3253' pro_nom='SANDWICH CRUDITÉS ET THON' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='7'/>
		<z:row pro_numpro='3252' pro_nom='MERGUEZ DE POISSON CRUE' pro_critere='J2' pro_t1='0' pro_t2='3' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='3251' pro_nom='JAMBON FARCI CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='22'
			 pro_t4='3'/>
		<z:row pro_numpro='3250' pro_nom='TRANCHE GRASSE DE CHEVAL CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='5'/>
		<z:row pro_numpro='3249' pro_nom='CHAUSSON AU JAMBON ET FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='6' pro_t4='3'/>
		<z:row pro_numpro='3248' pro_nom='COQUILLE SAINT JACQUES CUISINÉE AVEC FROMAGE' pro_critere='A5' pro_t1='0'
			 pro_t2='9' pro_t3='5' pro_t4='3'/>
		<z:row pro_numpro='3247' pro_nom='VIANDES CRUES POUR BROCHETTES' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='3246' pro_nom='OEUF DUR ET CHARCUTERIE CUITE NON ASSAISONNÉS' pro_critere='A5' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='15'/>
		<z:row pro_numpro='3245' pro_nom='PERDREAU ENTIER CRU' pro_critere='F5' pro_t1='0' pro_t2='2' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='3244' pro_nom='COQUELET ROTI FROID' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='9' pro_t4='3'/>
		<z:row pro_numpro='3243' pro_nom='RIZ ET FROMAGE EN SALADE' pro_critere='X22' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='9'/>
		<z:row pro_numpro='3242' pro_nom='BAVETTE DE CHEVAL CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='5'/>
		<z:row pro_numpro='3241' pro_nom='CHAMBERAT AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='3240' pro_nom='RIZ ET KAMABOKO NON ASSAISONNÉS' pro_critere='X22' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='8'/>
		<z:row pro_numpro='3239' pro_nom='APPAREIL A L&#x27;OEUF POUR BISCUIT' pro_critere='A5' pro_t1='0' pro_t2='10'
			 pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='3238' pro_nom='CREPE AU SAUMON FUMÉ CUITE' pro_critere='A8' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='5'/>
		<z:row pro_numpro='3237' pro_nom='SALADE CUIDITÉS CRUDITÉS ET SAUMON FUMÉ' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='6'/>
		<z:row pro_numpro='3236' pro_nom='SAUCE A LA CREME ET FINES HERBES &#x22;MAISON&#x22;' pro_critere='A5' pro_t1='0'
			 pro_t2='8' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='3235' pro_nom='POISSON CRU SALÉ' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='3234' pro_nom='CUIDITÉS ET OEUF DUR NON ASSAISONNÉS' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='15'/>
		<z:row pro_numpro='3233' pro_nom='GATEAU AUX CÉRÉALES' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='3232' pro_nom='GÉSIERS DE DINDE CRUS' pro_critere='F6' pro_t1='0' pro_t2='2' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='3231' pro_nom='COQUILLE AU CRABE MAYONNAISE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='6'/>
		<z:row pro_numpro='3230' pro_nom='PATES ET CUIDITÉS EN SALADE' pro_critere='X4' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='9'/>
		<z:row pro_numpro='3229' pro_nom='PASSE PIERRE CUITS NON ASSAISONNÉS' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='3228' pro_nom='AMANDES AU CHOCOLAT' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='3227' pro_nom='SALADE CUIDITÉS CRUDITÉS ET VOLAILLE' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='5'/>
		<z:row pro_numpro='3226' pro_nom='CRÉPINETTE DE PORC CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='3225' pro_nom='PAVÉ CREME AU BEURRE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3224' pro_nom='FEUILLETÉ JAMBON ET CHAMPIGNONS CUIT' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='2'/>
		<z:row pro_numpro='3223' pro_nom='SANDWICH A L&#x27;OMELETTE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='7'/>
		<z:row pro_numpro='3222' pro_nom='FILET DE MÉROU SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3221' pro_nom='CUISSE DE CANARD CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3220' pro_nom='CÉLERI RAVE CUIT NON ASSAISONNÉ' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='3219' pro_nom='OMELETTE CUITE AVEC FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='9' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='3218' pro_nom='ROTI DE POISSON CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='3217' pro_nom='FEUILLETÉ A LA COMPOTE CUIT' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='3216' pro_nom='FILET DE LIEU NOIR PANE CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='3215' pro_nom='TARTELETTE AUX FRUITS CUITE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='3214' pro_nom='CREPE AU CHOCOLAT' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='3213' pro_nom='FROMAGE A PATE PRESSÉE CUITE DE BREBIS AU LAIT PAST.' pro_critere='P5' pro_t1='0'
			 pro_t2='6' pro_t3='9' pro_t4='2'/>
		<z:row pro_numpro='3212' pro_nom='ESCALOPE DE PORC PRÉCUITE' pro_critere='B2' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='4'/>
		<z:row pro_numpro='3211' pro_nom='ANNEAUX D&#x27;ENCORNETS CRUS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='3210' pro_nom='FOIE DE VEAU CRU (F)' pro_critere='B15' pro_t1='0' pro_t2='1' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3209' pro_nom='MÉDAILLON DE POISSON CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='3208' pro_nom='MIXÉ DE FRUITS CUITS' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='8'
			 pro_t4='3'/>
		<z:row pro_numpro='3207' pro_nom='PALERON CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='3206' pro_nom='COTE DE VEAU AVEC FROMAGE CUISINÉE' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='3205' pro_nom='ARAIGNÉE DE BOEUF CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3204' pro_nom='FILET DE CANETTE CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='3203' pro_nom='CANETTE CRUE' pro_critere='F5' pro_t1='0' pro_t2='2' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='3202' pro_nom='CUISSE DE LAPIN CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='3201' pro_nom='GARNITURE CUITE POUR CHOUCROUTE SOUS VIDE' pro_critere='A5' pro_t1='0' pro_t2='9'
			 pro_t3='6' pro_t4='3'/>
		<z:row pro_numpro='3200' pro_nom='MONT D&#x27;OR AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='3199' pro_nom='RISSOLETTE DE LAPIN CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='3'/>
		<z:row pro_numpro='3198' pro_nom='MACARON MOUSSE CARAMEL' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='3197' pro_nom='MACARON MOUSSE AUX FRUITS' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='3196' pro_nom='FROMAGE A PATE MOLLE AU LAIT CRU DE MÉLANGE' pro_critere='P4' pro_t1='0'
			 pro_t2='6' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='3195' pro_nom='ESCALOPE DE VEAU PANÉE CRUE' pro_critere='F10' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='3194' pro_nom='CAPPUCCINO' pro_critere='O9' pro_t1='0' pro_t2='11' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3193' pro_nom='SAUCISSE DE CANARD SECHE' pro_critere='G1' pro_t1='0' pro_t2='5' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='3192' pro_nom='SAUTÉ DE VOLAILLE CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3191' pro_nom='SAUMON CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='3190' pro_nom='CUIDITÉS EN THON EN SALADE' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='14'/>
		<z:row pro_numpro='3189' pro_nom='CUISSE DE CANETTE CRUE' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3188' pro_nom='LIEVRE ENTIER CRU' pro_critere='D2' pro_t1='0' pro_t2='2' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='3187' pro_nom='NOUILLES CHINOISES CUITES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='5'/>
		<z:row pro_numpro='3186' pro_nom='SALADE COMPOSÉE CRUDITÉS AVEC VOLAILLE ET OEUF' pro_critere='X24' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='8'/>
		<z:row pro_numpro='3185' pro_nom='SALADE COMPOSÉE CRUDITÉS AVEC THON ET OEUF' pro_critere='X24' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='8'/>
		<z:row pro_numpro='3184' pro_nom='TARTE TATIN' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3183' pro_nom='QUEUE DE VEAU CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='3182' pro_nom='SPAGHETTIS BOLOGNAISE AVEC FROMAGE CUISINÉS' pro_critere='Z5' pro_t1='0'
			 pro_t2='9' pro_t3='8' pro_t4='3'/>
		<z:row pro_numpro='3181' pro_nom='FILET DE SOLE FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='3180' pro_nom='FOIE DE GÉNISSE CRU (F)' pro_critere='B15' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='3179' pro_nom='JARRET DE PORC FUMÉ CRU' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3178' pro_nom='RIS DE VEAU CRU (F)' pro_critere='B15' pro_t1='0' pro_t2='1' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3177' pro_nom='FOIE DE BOEUF CRU (F)' pro_critere='B15' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='3176' pro_nom='COEUR DE VEAU CRU (F)' pro_critere='B15' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='3175' pro_nom='LÉGUMES FRAIS' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='3174' pro_nom='ANETH SURGELÉE' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='1' pro_t4='4'/>
		<z:row pro_numpro='3173' pro_nom='PATE A PIZZA CRUE' pro_critere='A6' pro_t1='0' pro_t2='8' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='3172' pro_nom='VELOUTÉ DE LA MER CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='3'/>
		<z:row pro_numpro='3171' pro_nom='POMMES FORESTINES PRÉCUITES' pro_critere='A1' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='3'/>
		<z:row pro_numpro='3170' pro_nom='POMMES PAILLASSON PRÉCUITES' pro_critere='A1' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='3'/>
		<z:row pro_numpro='3169' pro_nom='POMMES NOISETTES PRÉCUITES' pro_critere='A1' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='3'/>
		<z:row pro_numpro='3168' pro_nom='POMMES CUBE RISSOLÉES PRÉCUITES SURGELÉES' pro_critere='A1' pro_t1='0'
			 pro_t2='4' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='3167' pro_nom='CREPE CRUE AUX CHAMPIGNONS ET LARDONS' pro_critere='A5' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='2'/>
		<z:row pro_numpro='3166' pro_nom='MACARON GLACÉ (F)' pro_critere='O15' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3165' pro_nom='ESCALOPE AVEC FROMAGE CUITE' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='3164' pro_nom='ABVT1 FILET DE LOTTE' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='3163' pro_nom='ABVT1 QUEUE DE LOTTE' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='3162' pro_nom='POITRINE DE PORC TRAITÉE EN SALAISON CUITE (D)' pro_critere='A5' pro_t1='0'
			 pro_t2='5' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3161' pro_nom='SARDINE SALÉE PRESSÉE' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='3160' pro_nom='PRÉPARATION HACHÉE DE POISSON PANÉE CUITE' pro_critere='A1' pro_t1='0'
			 pro_t2='9' pro_t3='5' pro_t4='5'/>
		<z:row pro_numpro='3159' pro_nom='PATES CUISINÉES AVEC FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='5'/>
		<z:row pro_numpro='3158' pro_nom='PAIN GARNI BÉCHAMEL FROMAGE, A CUIRE' pro_critere='A5' pro_t1='0' pro_t2='8'
			 pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='3157' pro_nom='TARTELETTE CREME CITRON' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='3156' pro_nom='STICK DE FROMAGE PANÉ CUIT' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='3155' pro_nom='CUIDITÉS CRUDITÉS ET GÉSIERS DE VOLAILLE NON ASSAISONNÉS' pro_critere='X24'
			 pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='11'/>
		<z:row pro_numpro='3154' pro_nom='BUNS VIANDE ET FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='4'/>
		<z:row pro_numpro='3153' pro_nom='CAROTTES RAPÉES ET OEUF DUR EN SALADE' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='4'/>
		<z:row pro_numpro='3152' pro_nom='ASPIC OEUF CHARCUTERIE CUITE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3151' pro_nom='HARICOTS VERTS EN SALADE' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='3150' pro_nom='GRAS DOUBLE CUIT (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='15' pro_t4='1'/>
		<z:row pro_numpro='3149' pro_nom='CARRÉ DE PORC FUMÉ CUIT (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='3148' pro_nom='DUCHESSE CHANTILLY S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3147' pro_nom='JOUE DE PORC CUITE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='14'
			 pro_t4='2'/>
		<z:row pro_numpro='3146' pro_nom='CREME VANILLE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3145' pro_nom='BLÉ CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='3'/>
		<z:row pro_numpro='3144' pro_nom='GÉSIERS DE CANARD CRUS' pro_critere='F6' pro_t1='0' pro_t2='2' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='3143' pro_nom='PANISSE FRIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='3'/>
		<z:row pro_numpro='3142' pro_nom='CANNELLONIS CUISINÉS AVEC FROMAGE A CUIRE' pro_critere='A5' pro_t1='0' pro_t2='9'
			 pro_t3='8' pro_t4='4'/>
		<z:row pro_numpro='3141' pro_nom='CONFIT DE POULE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='3140' pro_nom='ABVT1 SANDRE' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='3139' pro_nom='CHAIR A SAUCISSE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='3138' pro_nom='THÉ AROMATISÉ' pro_critere='A1' pro_t1='0' pro_t2='11' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='3137' pro_nom='BOISSON GOUT FRUITÉ' pro_critere='A1' pro_t1='0' pro_t2='11' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='3136' pro_nom='FILET DE SANDRE FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='3135' pro_nom='FILET DE FLÉTAN FUMÉ' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='3134' pro_nom='DARNE DE COLIN SURGELÉE' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3133' pro_nom='SPÉCIALITÉ FROMAGERE AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6'
			 pro_t3='11' pro_t4='1'/>
		<z:row pro_numpro='3132' pro_nom='COEURS DE CANARD CRUS' pro_critere='F6' pro_t1='0' pro_t2='2' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='3131' pro_nom='POMMES DE TERRE ET FRUITS DE MER EN SALADE' pro_critere='X22' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='13'/>
		<z:row pro_numpro='3130' pro_nom='PAUPIETTE DE GIBIER CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='3129' pro_nom='GRAISSE DE CANARD CRUE' pro_critere='S2' pro_t1='0' pro_t2='12' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3128' pro_nom='LOUKOUM' pro_critere='A1' pro_t1='0' pro_t2='12' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3127' pro_nom='FINGER DE VOLAILLE AVEC FROMAGE PRÉCUIT' pro_critere='F8' pro_t1='0' pro_t2='9'
			 pro_t3='3' pro_t4='5'/>
		<z:row pro_numpro='3126' pro_nom='SAUCE BÉARNAISE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='9' pro_t4='3'/>
		<z:row pro_numpro='3125' pro_nom='BROCHETTE DE DINDE AVEC FROMAGE CUITE' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='3124' pro_nom='STEAK DE THON PRÉCUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='3123' pro_nom='PRÉPARATION HACHÉE DE VEAU CRUE' pro_critere='B1' pro_t1='0' pro_t2='1'
			 pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='3122' pro_nom='COTE DE PORC PRÉCUITE' pro_critere='B2' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='4'/>
		<z:row pro_numpro='3121' pro_nom='SANDWICH OEUF JAMBON CUIT ET FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='8'
			 pro_t3='3' pro_t4='7'/>
		<z:row pro_numpro='3120' pro_nom='PIZZA AUX ANCHOIS CUITE' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='7'/>
		<z:row pro_numpro='3119' pro_nom='FEUILLETÉ AU FROMAGE A CUIRE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='3118' pro_nom='BLANC DE VOLAILLE PRÉCUIT' pro_critere='F1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='5'/>
		<z:row pro_numpro='3117' pro_nom='ROGNONS DE BOEUF CRUS (F)' pro_critere='B15' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='3116' pro_nom='NAVET RAPÉ' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='3115' pro_nom='PRÉPARATION HACHÉE DE VEAU PRÉCUITE' pro_critere='B1' pro_t1='0' pro_t2='9'
			 pro_t3='4' pro_t4='3'/>
		<z:row pro_numpro='3114' pro_nom='FILET DE DINDE CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='3113' pro_nom='POMMES DE TERRE ET CHARCUTERIE CUITE EN SALADE' pro_critere='X22' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='5'/>
		<z:row pro_numpro='3112' pro_nom='DÉCOUPE DE BICHE CRUE P' pro_critere='D2' pro_t1='0' pro_t2='2' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='3111' pro_nom='DÉCOUPE DE CHEVREUIL CRUE P' pro_critere='D2' pro_t1='0' pro_t2='2' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='3110' pro_nom='DÉCOUPE DE LIEVRE CRUE P' pro_critere='D2' pro_t1='0' pro_t2='2' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='3109' pro_nom='TETE D&#x27;AGNEAU CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='3'/>
		<z:row pro_numpro='3108' pro_nom='FEUILLETÉ AUX OEUFS CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='9'/>
		<z:row pro_numpro='3107' pro_nom='AIGUILLETTE DE DINDE CRUE' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3106' pro_nom='ROTI DE LAPIN FARCI CUIT FROID' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='9'
			 pro_t4='2'/>
		<z:row pro_numpro='3105' pro_nom='PATES ET SAUCISSON SEC EN SALADE' pro_critere='X26' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='9'/>
		<z:row pro_numpro='3104' pro_nom='POULET PRÉCUIT' pro_critere='F1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='3103' pro_nom='CARPACCIO DE VOLAILLE' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='3102' pro_nom='BACON CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3101' pro_nom='FILET DE DINDE AVEC FROMAGE CUISINÉ' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='3100' pro_nom='JAMBON CUIT EN GELÉE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3099' pro_nom='SAUCISSE DE LYON CUITE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='3098' pro_nom='ÉMINCÉ DE PORC CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='3097' pro_nom='MAIGRE DE PORC CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='3096' pro_nom='PURÉE DE CAROTTE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='3095' pro_nom='SURIMI CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='3094' pro_nom='MOUSSE DE POISSON CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='3'/>
		<z:row pro_numpro='3093' pro_nom='PAVÉ D&#x27;AFFINOIS' pro_critere='O7' pro_t1='0' pro_t2='6' pro_t3='7' pro_t4='2'/>
		<z:row pro_numpro='3092' pro_nom='THÉ GLACÉ' pro_critere='A1' pro_t1='0' pro_t2='11' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='3091' pro_nom='TOMATES TRANCHÉES SURGELÉES' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3090' pro_nom='SALADE CUIDITÉS CRUDITÉS ET FROMAGE' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='8'/>
		<z:row pro_numpro='3089' pro_nom='QUEUE DE BOEUF CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3088' pro_nom='HAMPE DE CHEVAL CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='5'/>
		<z:row pro_numpro='3087' pro_nom='PAUPIETTE DE FAISAN CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='3086' pro_nom='COQUILLE DE POISSON AU FROMAGE CUISINÉE' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='5' pro_t4='3'/>
		<z:row pro_numpro='3085' pro_nom='FEUILLETÉ JAMBON CHAMPIGNONS FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='2'/>
		<z:row pro_numpro='3084' pro_nom='CASTEL CREME AU BEURRE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3083' pro_nom='GATEAU AUX NOIX' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3082' pro_nom='TARTE AUX LÉGUMES AVEC FROMAGE CUITE' pro_critere='Z5' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='8'/>
		<z:row pro_numpro='3081' pro_nom='CHARCUTERIE AU FROMAGE CUISINÉE' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='2'/>
		<z:row pro_numpro='3080' pro_nom='RAVIOLIS FRAIS' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='3079' pro_nom='GAUFRE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='3078' pro_nom='PATISSERIE ORIENTALE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3077' pro_nom='THON MAYONNAISE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='3076' pro_nom='SAUCISSE CUITE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='3075' pro_nom='AVOCAT AU THON NON ASSAISONNÉ' pro_critere='X21' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='13'/>
		<z:row pro_numpro='3074' pro_nom='PRÉPARATION HACHÉE DE PORC ET FROMAGE CRUE' pro_critere='Z6' pro_t1='0'
			 pro_t2='1' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='3073' pro_nom='AIGUILLETTE BARONNE DE BOEUF CRUE' pro_critere='B2' pro_t1='0' pro_t2='1'
			 pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3072' pro_nom='CHAMPIGNONS DÉSHYDRATÉS' pro_critere='U3' pro_t1='0' pro_t2='4' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3071' pro_nom='FILET DE CANARD TRAITÉ EN SALAISON CUIT (D)' pro_critere='A5' pro_t1='0'
			 pro_t2='5' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='3070' pro_nom='BUCHETTE DE POULET EN GELÉE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='3069' pro_nom='ESCALOPE DE PINTADE CRUE' pro_critere='F17' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3068' pro_nom='FLAN AU JAMBON CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='2'/>
		<z:row pro_numpro='3067' pro_nom='PETITS FOURS CREME PATISSIERE ET FRUITS FRAIS' pro_critere='P1' pro_t1='0'
			 pro_t2='10' pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='3066' pro_nom='PRAIRES FARCIES CUITES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='3065' pro_nom='COU DE CANARD FARCI (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='9'
			 pro_t4='1'/>
		<z:row pro_numpro='3064' pro_nom='FILET DE LOTTE FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='3063' pro_nom='ROULADE PISTACHE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='12' pro_t4='1'/>
		<z:row pro_numpro='3062' pro_nom='SAUCISSE BLANCHE CUITE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='3061' pro_nom='ROULÉ A LA CREME DE MARRONS' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='3060' pro_nom='TORTELLINIS FRAIS AU FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='3059' pro_nom='POMMES DE TERRE ET SURIMI EN SALADE' pro_critere='X22' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='13'/>
		<z:row pro_numpro='3058' pro_nom='DIOT A CUIRE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='3057' pro_nom='TOMATE ET OEUF DUR EN SALADE' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='15'/>
		<z:row pro_numpro='3056' pro_nom='SAUCISSON A CUIRE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='3055' pro_nom='BOEUF A FONDUE CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3054' pro_nom='STEAK DE MERLU SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3053' pro_nom='CUISSE DE CANETTE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='3052' pro_nom='ASPIC AU POISSON CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3051' pro_nom='LANGOUSTE CUITE MAYONNAISE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='6'/>
		<z:row pro_numpro='3050' pro_nom='GATEAU DE FOIES DE VOLAILLE CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2'
			 pro_t4='3'/>
		<z:row pro_numpro='3049' pro_nom='BUCHETTE JAMBON CUIT MACÉDOINE EN GELÉE' pro_critere='A5' pro_t1='0' pro_t2='8'
			 pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3048' pro_nom='CONFIT DE VOLAILLE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='2'/>
		<z:row pro_numpro='3047' pro_nom='LÉGUMES EN GRATIN AVEC FROMAGE A CUIRE' pro_critere='A5' pro_t1='0' pro_t2='9'
			 pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='3046' pro_nom='MILLE-FEUILLE CREME MOUSSELINE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='3045' pro_nom='BOUCHÉE AUX ESCARGOTS CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='9'/>
		<z:row pro_numpro='3044' pro_nom='PATES FARCIES PRÉCUITES' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='3043' pro_nom='POITRINE D&#x27;AGNEAU FARCIE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='3042' pro_nom='BUCHE GLACÉE' pro_critere='O1' pro_t1='0' pro_t2='10' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='3041' pro_nom='CARPACCIO DE SAUMON' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='3040' pro_nom='CHAPON CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='3039' pro_nom='ASPIC OEUF SURIMI' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3038' pro_nom='ROTI DE VOLAILLE CUIT' pro_critere='A2' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='3037' pro_nom='LAGUIOLE AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='3036' pro_nom='TOURNEDOS D&#x27;AGNEAU CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3035' pro_nom='BLANC DE VOLAILLE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='3034' pro_nom='CRUDITÉS ET THON MAYONNAISE' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='6'/>
		<z:row pro_numpro='3033' pro_nom='TRUITE CUITE FARCIE' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='19' pro_t4='1'/>
		<z:row pro_numpro='3032' pro_nom='JUMEAU DE BOEUF CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3031' pro_nom='PATES ET FROMAGE NON ASSAISONNÉS' pro_critere='X22' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='8'/>
		<z:row pro_numpro='3030' pro_nom='CORDON BLEU DE POULET CRU' pro_critere='F10' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3029' pro_nom='CROISSANT CRU' pro_critere='A6' pro_t1='0' pro_t2='8' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='3028' pro_nom='SALADE CUIDITÉS CRUDITÉS AUX LARDONS' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='11'/>
		<z:row pro_numpro='3027' pro_nom='DINDE FARCIE CUITE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='12'
			 pro_t4='1'/>
		<z:row pro_numpro='3026' pro_nom='COTTY SALÉ CUIT (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='3025' pro_nom='FILET D&#x27;AGNEAU CRU P' pro_critere='E1' pro_t1='0' pro_t2='1' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3024' pro_nom='ÉPAULE D&#x27;AGNEAU CRUE P' pro_critere='E1' pro_t1='0' pro_t2='1' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3023' pro_nom='COTE D&#x27;AGNEAU CRUE P' pro_critere='E1' pro_t1='0' pro_t2='1' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='3022' pro_nom='GATEAU A LA FRANGIPANE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='3021' pro_nom='CANAPÉS DIVERS DENRÉES ANIMALES CUITES' pro_critere='A5' pro_t1='0' pro_t2='8'
			 pro_t3='3' pro_t4='7'/>
		<z:row pro_numpro='3020' pro_nom='CARPACCIO DE SAUMON CRU SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='3019' pro_nom='PAIN AU LAIT CRU' pro_critere='A6' pro_t1='0' pro_t2='8' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='3018' pro_nom='PETIT SALÉ AUX LENTILLES CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='1' pro_t4='5'/>
		<z:row pro_numpro='3017' pro_nom='STEAK DE POISSON CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='3016' pro_nom='PATE A BRIOCHE CRUE' pro_critere='A6' pro_t1='0' pro_t2='8' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='3015' pro_nom='GAMBAS CUITES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='5'/>
		<z:row pro_numpro='3014' pro_nom='TOURTE CUITE A LA CHARCUTERIE CUITE' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='4'/>
		<z:row pro_numpro='3013' pro_nom='SALADE CUIDITÉS CRUDITÉS ET KAMABOKO' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='14'/>
		<z:row pro_numpro='3012' pro_nom='FEUILLETÉ JAMBON CHAMPIGNON PRÉCUIT' pro_critere='A5' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='9'/>
		<z:row pro_numpro='3011' pro_nom='PRÉPARATION HACHÉE DE PORC CRUE' pro_critere='B1' pro_t1='0' pro_t2='1'
			 pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='3010' pro_nom='TRIANON' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='3009' pro_nom='POUDRE DÉSHYDRATÉE' pro_critere='A1' pro_t1='0' pro_t2='12' pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='3008' pro_nom='ABVT1 FILET DE MOSTELLE' pro_critere='V12' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='3007' pro_nom='QUEUE DE PORC CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='3006' pro_nom='TARTE CREME MOUSSELINE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='3005' pro_nom='FRESSURE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='14' pro_t4='2'/>
		<z:row pro_numpro='3004' pro_nom='TOMATE TRANCHÉE 4G (F)' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='3003' pro_nom='TIMBALE DE POISSON CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='3002' pro_nom='BISCUIT APÉRITIF AVEC FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='9'/>
		<z:row pro_numpro='3001' pro_nom='BAVETTE DE VEAU CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='3000' pro_nom='OEUFS DE POISSON FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='12'
			 pro_t4='1'/>
		<z:row pro_numpro='2999' pro_nom='PAIN DE POISSON CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='2998' pro_nom='CRUDITÉS ET CHARCUTERIE CUITE EN SALADE' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='11'/>
		<z:row pro_numpro='2997' pro_nom='DARNE DE TRUITE FRAICHE' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='2996' pro_nom='RIZ ET SALAMI EN SALADE' pro_critere='X26' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='9'/>
		<z:row pro_numpro='2995' pro_nom='PATES ET FRUITS DE MER EN SALADE' pro_critere='X22' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='10'/>
		<z:row pro_numpro='2994' pro_nom='LIMANDE PELÉE PAC' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='2993' pro_nom='JAMBON ET FROMAGE PANÉ PRÉCUIT' pro_critere='A5' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='3'/>
		<z:row pro_numpro='2992' pro_nom='POISSON RECONSTITUÉ PRÉCUIT' pro_critere='J2' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='6'/>
		<z:row pro_numpro='2991' pro_nom='PANINI A LA VIANDE DE VOLAILLE, A CUIRE' pro_critere='A5' pro_t1='0' pro_t2='8'
			 pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='2990' pro_nom='PANINI AU SAUMON FUMÉ, A CUIRE' pro_critere='A8' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='4'/>
		<z:row pro_numpro='2989' pro_nom='PANINI CHARCUTERIE CUITE, A CUIRE' pro_critere='A5' pro_t1='0' pro_t2='8'
			 pro_t3='3' pro_t4='3'/>
		<z:row pro_numpro='2988' pro_nom='PANINI AU JAMBON CRU, A CUIRE' pro_critere='F3' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='2987' pro_nom='SAUCISSON CUIT DE CHEVAL (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='2986' pro_nom='PAIN DE VIANDE AVEC FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='2985' pro_nom='FOIE DE VEAU CRU (D)' pro_critere='B16' pro_t1='0' pro_t2='1' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2984' pro_nom='PARFAIT GLACÉ' pro_critere='O1' pro_t1='0' pro_t2='10' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='2983' pro_nom='TARTE AUX FRUITS A CUIRE' pro_critere='A6' pro_t1='0' pro_t2='10' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='2982' pro_nom='ABVT1 PAJOT' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='2981' pro_nom='CREME FRAICHE PASTEURISÉE' pro_critere='O4' pro_t1='0' pro_t2='6' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='2980' pro_nom='CAROTTES RAPÉES ET OEUFS DURS NON ASSAISONNÉS' pro_critere='X24' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='15'/>
		<z:row pro_numpro='2979' pro_nom='BIOUX FRAIS' pro_critere='K1' pro_t1='0' pro_t2='3' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='2978' pro_nom='OEUF CUISINÉ AVEC FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='9' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='2977' pro_nom='SAUCISSE DE VOLAILLE CUITE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='2976' pro_nom='DUO DE DINDE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2975' pro_nom='TETE DE PORC SALÉE CUITE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='2974' pro_nom='RIZ ET CHORIZO EN SALADE' pro_critere='X26' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='9'/>
		<z:row pro_numpro='2973' pro_nom='ABVT1 FILET DE THON' pro_critere='V14' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='2972' pro_nom='VIANDE HACHÉE DE VEAU CRUE TRAITÉE EN SALAISON' pro_critere='F4' pro_t1='0'
			 pro_t2='5' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='2971' pro_nom='GRATIN DE POMMES DE TERRE AU FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='8' pro_t4='3'/>
		<z:row pro_numpro='2970' pro_nom='FILET DE HARENG MARINÉ' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='2969' pro_nom='SAVARIN CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='2968' pro_nom='SANDWICH AU SURIMI' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='3' pro_t4='4'/>
		<z:row pro_numpro='2967' pro_nom='THON CUIT NON ASSAISONNÉ' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='14'/>
		<z:row pro_numpro='2966' pro_nom='BOEUF CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='2965' pro_nom='FILET DE JULIENNE SALÉ' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='2964' pro_nom='FILET DE MÉROU FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='2963' pro_nom='ABVT1 FILET DE MÉROU' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='2962' pro_nom='FILET DE REQUIN FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='2961' pro_nom='ABVT3 FILET DE REQUIN' pro_critere='V15' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='3'/>
		<z:row pro_numpro='2960' pro_nom='JOUE DE BOEUF CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='2959' pro_nom='DÉCOUPE DE DINDE CRUE' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='2958' pro_nom='LARDONS CUITS (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='22' pro_t4='1'/>
		<z:row pro_numpro='2957' pro_nom='TARTE A LA CREME ET FRUITS CUITE' pro_critere='P1' pro_t1='0' pro_t2='10'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2956' pro_nom='TARTELETTE CUITE AUX POIRES' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='2955' pro_nom='DUCHESSE CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='2954' pro_nom='CREME SOUFFLÉE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2953' pro_nom='POIVRONS FARCIS CUITS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='2952' pro_nom='ROTI DE PORC SAUMURÉ CRU' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='2951' pro_nom='BUGNES' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2950' pro_nom='ABVT2 FILET DE SÉBASTE' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='2949' pro_nom='FEUILLETÉ AUX ESCARGOTS CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='9'/>
		<z:row pro_numpro='2948' pro_nom='PYRÉNÉES AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='9'
			 pro_t4='1'/>
		<z:row pro_numpro='2947' pro_nom='PROFITEROLES SURGELÉES (F)' pro_critere='O15' pro_t1='0' pro_t2='10' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='2946' pro_nom='SANDWICH AU BACON' pro_critere='F3' pro_t1='0' pro_t2='8' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='2945' pro_nom='POMMES DE TERRE ET FROMAGE EN SALADE' pro_critere='X22' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='2944' pro_nom='MERINGUE CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='2943' pro_nom='CHAMPIGNONS CRUS MAYONNAISE' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='2942' pro_nom='COQUES CUITES DÉCOQUILLÉES' pro_critere='J3' pro_t1='0' pro_t2='3' pro_t3='5'
			 pro_t4='3'/>
		<z:row pro_numpro='2941' pro_nom='SALADE DE FRUITS SURGELÉE' pro_critere='U2' pro_t1='0' pro_t2='10' pro_t3='8'
			 pro_t4='2'/>
		<z:row pro_numpro='2940' pro_nom='COU DE CANARD FARCI (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='9'
			 pro_t4='1'/>
		<z:row pro_numpro='2939' pro_nom='COQUELET PRÉCUIT' pro_critere='F1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='5'/>
		<z:row pro_numpro='2938' pro_nom='ÉCHINE DE PORC CUITE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='2937' pro_nom='CREME FRAICHE MATURÉE CRUE' pro_critere='N8' pro_t1='0' pro_t2='6' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='2936' pro_nom='PARIS BREST CREME CHANTILLY S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='2935' pro_nom='HARENG MARINÉ' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='2934' pro_nom='VIANDE BLANCHE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='2933' pro_nom='CÉLERI RAVE CUIT ASSAISONNÉ' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='2932' pro_nom='DARNE DE LIEU JAUNE FRAICHE' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='2931' pro_nom='PAVÉ D&#x27;AUTRUCHE CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='2930' pro_nom='GITE DE BOEUF CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='2929' pro_nom='POMMES DE TERRE ET VIANDE CUITE EN SALADE' pro_critere='X22' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='11'/>
		<z:row pro_numpro='2928' pro_nom='SALAMI DE VOLAILLE' pro_critere='G1' pro_t1='0' pro_t2='5' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='2927' pro_nom='VIANDE HACHÉE DE VOLAILLE CRUE' pro_critere='F2' pro_t1='0' pro_t2='2' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='2926' pro_nom='VIANDE HACHÉE DE MOUTON CRUE' pro_critere='B1' pro_t1='0' pro_t2='1' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='2925' pro_nom='SALADE CUIDITÉS CRUDITÉS ET COPPA' pro_critere='X28' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='11'/>
		<z:row pro_numpro='2924' pro_nom='GIGOT D&#x27;AGNEAU CRU P' pro_critere='E1' pro_t1='0' pro_t2='1' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='2923' pro_nom='COLLIER D&#x27;AGNEAU CRU P' pro_critere='E1' pro_t1='0' pro_t2='1' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='2922' pro_nom='POITRINE D&#x27;AGNEAU CRUE P' pro_critere='E1' pro_t1='0' pro_t2='1' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='2921' pro_nom='CREPE AUX FRUITS DE MER CUITE AVEC FROMAGE A CUIRE' pro_critere='A5' pro_t1='0'
			 pro_t2='8' pro_t3='7' pro_t4='3'/>
		<z:row pro_numpro='2920' pro_nom='PATES ET SURIMI EN SALADE' pro_critere='X22' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='4'/>
		<z:row pro_numpro='2919' pro_nom='LANGUE D&#x27;AGNEAU CUITE FROIDE' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='9' pro_t4='4'/>
		<z:row pro_numpro='2918' pro_nom='ASPIC OEUF' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='2917' pro_nom='FROMAGE BLANC BATTU PASTEURISÉ (D)' pro_critere='O3' pro_t1='0' pro_t2='6'
			 pro_t3='6' pro_t4='2'/>
		<z:row pro_numpro='2916' pro_nom='VIANDE DE VOLAILLE CRUE' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='2915' pro_nom='PRÉPARATION HACHÉE DE VOLAILLE PRÉCUITE' pro_critere='F2' pro_t1='0' pro_t2='9'
			 pro_t3='4' pro_t4='6'/>
		<z:row pro_numpro='2914' pro_nom='FILET MIGNON DE PORC CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='3'/>
		<z:row pro_numpro='2913' pro_nom='HARICOTS BEURRE NON ASSAISONNÉS' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='2912' pro_nom='MIXÉ DE BOEUF CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2911' pro_nom='SAUCISSE DE JAMBON CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='2910' pro_nom='BARON D&#x27;AGNEAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='2909' pro_nom='FROMAGE A PATE PRESSÉE NC DE VACHE AU LAIT CRU' pro_critere='P4' pro_t1='0'
			 pro_t2='6' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='2908' pro_nom='ENTREMET CREME AU BEURRE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='2907' pro_nom='TERRINE DE VIANDE A CUIRE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='2906' pro_nom='SAVARIN CREME CHANTILLY (D)' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='2905' pro_nom='PRÉLEVEMENT SUR CARCASSE D&#x27;OVIN P' pro_critere='D1' pro_t1='0' pro_t2='1'
			 pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='2904' pro_nom='CANARD ENTIER CRU' pro_critere='F5' pro_t1='0' pro_t2='2' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='2903' pro_nom='CREVETTES ENTIERES CRUES (D) DÉCONGELÉES' pro_critere='J1' pro_t1='0' pro_t2='3'
			 pro_t3='7' pro_t4='6'/>
		<z:row pro_numpro='2902' pro_nom='CROTTIN DE CHAVIGNOL AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='2901' pro_nom='FAUX FILET DE BOEUF CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='2900' pro_nom='CHEESEBURGER PRÉCUIT' pro_critere='Z6' pro_t1='0' pro_t2='9' pro_t3='4' pro_t4='3'/>
		<z:row pro_numpro='2899' pro_nom='CAKE AU FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='9'/>
		<z:row pro_numpro='2898' pro_nom='CAROTTES EN BATONNETS' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='2897' pro_nom='SANDWICH OEUF BACON' pro_critere='F3' pro_t1='0' pro_t2='8' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='2896' pro_nom='SANDWICH PASTRAMI' pro_critere='G1' pro_t1='0' pro_t2='8' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='2895' pro_nom='TARTELETTE AUX NOIX' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2894' pro_nom='BOUDIN DE VIANDE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='16' pro_t4='1'/>
		<z:row pro_numpro='2893' pro_nom='JAMBON HACHÉ CUIT RECONSTITUÉ (D)' pro_critere='A5' pro_t1='0' pro_t2='9'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2892' pro_nom='VIANDE HACHÉE DE VOLAILLE PANÉE CRUE AU FROMAGE' pro_critere='F2' pro_t1='0'
			 pro_t2='2' pro_t3='7' pro_t4='2'/>
		<z:row pro_numpro='2891' pro_nom='ROTI DE CANARD CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='2890' pro_nom='BOYAU DE PORC CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='2889' pro_nom='PARURE DE PORC CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='2888' pro_nom='POMMES DAUPHINES PRÉCUITES SURGELÉES' pro_critere='A1' pro_t1='0' pro_t2='4'
			 pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='2887' pro_nom='LARDONS FUMÉS CUITS (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='2886' pro_nom='SELLES SUR CHER AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='2885' pro_nom='ROTI DE LAPIN FARCI CRU' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='2884' pro_nom='CAVIAR D&#x27;AUBERGINES CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='2883' pro_nom='ROCAMADOUR AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='2882' pro_nom='MADELEINE FOURRÉE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2881' pro_nom='MOUSSAKA AVEC FROMAGE CUITE' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='2880' pro_nom='ROULEAU DE COLIN FARCI CUIT SURGELÉ' pro_critere='A1' pro_t1='0' pro_t2='3'
			 pro_t3='12' pro_t4='1'/>
		<z:row pro_numpro='2879' pro_nom='COTE DE PORC SAUMURÉE CRUE' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='2878' pro_nom='PIZZA PRÉCUITE' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='7'/>
		<z:row pro_numpro='2877' pro_nom='JAMBON DE VOLAILLE CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='2876' pro_nom='POULIGNY SAINT PIERRE AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6'
			 pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='2875' pro_nom='CRUDITÉS ET OEUFS DURS EN SALADE' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='7'/>
		<z:row pro_numpro='2874' pro_nom='FILET MIGNON DE PORC CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='2873' pro_nom='ARTICHAUT SURGELÉ' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='2872' pro_nom='CROISSANT AUX ABRICOTS CRU' pro_critere='A6' pro_t1='0' pro_t2='8' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='2871' pro_nom='STEAK HACHÉ DE BOEUF PRÉCUIT AVEC FROMAGE' pro_critere='Z6' pro_t1='0' pro_t2='9'
			 pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='2870' pro_nom='BROCHETTE DE MAGRET CRUE' pro_critere='F10' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='2869' pro_nom='TARTELETTE DE RIZ' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2868' pro_nom='ROTI D&#x27;AUTRUCHE CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='2867' pro_nom='PAIN A L&#x27;AIL PRÉCUIT' pro_critere='A6' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='9'/>
		<z:row pro_numpro='2866' pro_nom='ENTRECOTE DE BOEUF CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='2865' pro_nom='BOUCHÉE CHARCUTIERE CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='2864' pro_nom='MOUSSE DE FOIE GRAS (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='11'
			 pro_t4='2'/>
		<z:row pro_numpro='2863' pro_nom='MÉDAILLON DE SAUMON CUIT FROID' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='2862' pro_nom='PATES ET POISSON FUMÉ EN SALADE' pro_critere='X22' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='13'/>
		<z:row pro_numpro='2861' pro_nom='MAGRET DE CANARD FUMÉ CRU' pro_critere='F7' pro_t1='0' pro_t2='5' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='2860' pro_nom='CHOUX CUITS A FOURRER' pro_critere='A1' pro_t1='0' pro_t2='12' pro_t3='2'
			 pro_t4='5'/>
		<z:row pro_numpro='2859' pro_nom='GRATIN DE PATES AVEC FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='8' pro_t4='3'/>
		<z:row pro_numpro='2858' pro_nom='ROULADE DE POULET CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='2857' pro_nom='FILET DE POULET FUMÉ TRAITÉ EN SALAISON CUIT (D)' pro_critere='A5' pro_t1='0'
			 pro_t2='5' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2856' pro_nom='CAROTTES ENTIERES EPLUCHÉES SURGELÉES' pro_critere='U2' pro_t1='0' pro_t2='4'
			 pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='2855' pro_nom='TARTE AU SAUMON PRÉCUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='8'/>
		<z:row pro_numpro='2854' pro_nom='BISCUIT SEC' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='2853' pro_nom='COU DE POULET CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='2852' pro_nom='VIENNOIS CRU AU JAMBON' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='2851' pro_nom='TRUITE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='3'/>
		<z:row pro_numpro='2850' pro_nom='TETE DE VEAU (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='14' pro_t4='2'/>
		<z:row pro_numpro='2849' pro_nom='PAIN AU FROMAGE, A CUIRE' pro_critere='A7' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='6'/>
		<z:row pro_numpro='2848' pro_nom='CREPE CRUE AUX CHAMPIGNONS' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='6'
			 pro_t4='9'/>
		<z:row pro_numpro='2847' pro_nom='SOLE PELÉE' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='2846' pro_nom='AVOCAT AU THON ASSAISONNÉ' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='13'/>
		<z:row pro_numpro='2845' pro_nom='VIENNOIS JAMBON BÉCHAMEL CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='2844' pro_nom='ROULÉ CUIT AU JAMBON ET FROMAGE, A CUIRE' pro_critere='A5' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='2'/>
		<z:row pro_numpro='2843' pro_nom='CREPE CRUE AU JAMBON ET CHAMPIGNONS' pro_critere='A5' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='2'/>
		<z:row pro_numpro='2842' pro_nom='PATES EN GRATIN AVEC FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='3'/>
		<z:row pro_numpro='2841' pro_nom='ABVT1 FILET DE SILURE' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='2840' pro_nom='ABVT1 FILET DE CAPITAINE' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='2839' pro_nom='ABVT1 BROCHET' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='2838' pro_nom='ENCORNET FARCI CRU' pro_critere='J2' pro_t1='0' pro_t2='3' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='2837' pro_nom='COEUR DE TRANCHE DE BOEUF CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='2836' pro_nom='JOUE DE PORC CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='2835' pro_nom='FILET DE TRUITE FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='2834' pro_nom='FILET D&#x27;EMPEREUR FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='2833' pro_nom='TARTINE AU FROMAGE' pro_critere='A7' pro_t1='0' pro_t2='8' pro_t3='3' pro_t4='6'/>
		<z:row pro_numpro='2832' pro_nom='CRUDITÉS ET OMELETTE NON ASSAISONNÉS' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='15'/>
		<z:row pro_numpro='2831' pro_nom='AVOCAT AU POISSON NON ASSAISONNÉ' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='13'/>
		<z:row pro_numpro='2830' pro_nom='FILET DE TRUITE FUMÉ' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='2829' pro_nom='ABVT1 SAUMON DE L&#x27;ATLANTIQUE' pro_critere='V12' pro_t1='0' pro_t2='3'
			 pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='2828' pro_nom='MAIGRE DE MOUTON CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='4'/>
		<z:row pro_numpro='2827' pro_nom='BLÉ ET CRUDITÉS EN SALADE' pro_critere='X4' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='9'/>
		<z:row pro_numpro='2825' pro_nom='T BONE DE BOEUF CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='2823' pro_nom='PRÉPARATION HACHÉE DE POISSON CUITE' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='2821' pro_nom='ABVT1 TURBOT' pro_critere='V11' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='2817' pro_nom='BOUCHÉE DE RIS DE VEAU CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='2816' pro_nom='FILET DE POISSON CONGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='2814' pro_nom='LASAGNES CUISINÉES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='4'/>
		<z:row pro_numpro='2810' pro_nom='CONCOMBRE AU YAOURT' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='2809' pro_nom='COQUILLE AU KAMABOKO CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='3'/>
		<z:row pro_numpro='2807' pro_nom='MIXÉ DE JAMBON AVEC FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2805' pro_nom='BOUCHÉE A LA REINE CUITE AU FROMAGE A CUIRE' pro_critere='A5' pro_t1='0'
			 pro_t2='8' pro_t3='7' pro_t4='9'/>
		<z:row pro_numpro='2804' pro_nom='TOPPING' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='2802' pro_nom='PATES ET FROMAGE EN SALADE' pro_critere='X22' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='8'/>
		<z:row pro_numpro='2801' pro_nom='BUNS AU FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='4'/>
		<z:row pro_numpro='2800' pro_nom='MOUSSE DE JAMBON (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='2799' pro_nom='GALETTE NATURE CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='9'/>
		<z:row pro_numpro='2797' pro_nom='FARCE DE VOLAILLE PRÉCUITE' pro_critere='F2' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='3'/>
		<z:row pro_numpro='2796' pro_nom='PAIN VIENNOIS AU JAMBON ET FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='2'/>
		<z:row pro_numpro='2793' pro_nom='POITRINE DE PORC FUMÉE CUITE (D)' pro_critere='A5' pro_t1='0' pro_t2='5'
			 pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='2790' pro_nom='POMMES DE TERRE AU FROMAGE CUITES' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='2789' pro_nom='CAKE AUX FRUITS' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2787' pro_nom='COQUILLE DE POISSON CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='6'/>
		<z:row pro_numpro='2786' pro_nom='COQUILLE AU CRABE CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='6'/>
		<z:row pro_numpro='2783' pro_nom='SALADE CUIDITÉS CRUDITÉS AUX ABATS CUITS' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='5'/>
		<z:row pro_numpro='2782' pro_nom='SALADE CUIDITÉS CRUDITÉS ET THON' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='13'/>
		<z:row pro_numpro='2781' pro_nom='ROTI DE DINDE AU FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='2780' pro_nom='CROISSANT CUIT' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='2773' pro_nom='BROCHETTE ORIENTALE CRUE' pro_critere='F10' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='2772' pro_nom='PAVÉ A LA GANACHE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='2771' pro_nom='PATE DE CACAO CUITE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='2767' pro_nom='VOLAILLE ENTIERE CRUE' pro_critere='F5' pro_t1='0' pro_t2='2' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='2766' pro_nom='ROTI DE VIANDE CRU AU FROMAGE' pro_critere='F10' pro_t1='0' pro_t2='1' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='2764' pro_nom='POITRINE ROULÉE CUITE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='2763' pro_nom='GÉNOISE MOUSSE AUX FRUITS' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='2762' pro_nom='FILET DE PORC FUMÉ CRU' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='2761' pro_nom='RISSOLETTE DE VOLAILLE PANÉE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='4' pro_t4='4'/>
		<z:row pro_numpro='2760' pro_nom='ROULADE AUX OLIVES (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='12'
			 pro_t4='1'/>
		<z:row pro_numpro='2759' pro_nom='CANNELLONIS AU FROMAGE CUISINÉS' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='7'/>
		<z:row pro_numpro='2758' pro_nom='COTE DE VEAU PRÉCUITE' pro_critere='B2' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='4'/>
		<z:row pro_numpro='2757' pro_nom='TARTE AU POISSON ET FROMAGE CUITE' pro_critere='Z5' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='5'/>
		<z:row pro_numpro='2754' pro_nom='MELON SURGELÉ' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='2753' pro_nom='BROCHETTE DE POISSON FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='2751' pro_nom='ENTRECOTE DE CHEVAL CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='5'/>
		<z:row pro_numpro='2749' pro_nom='CRUDITÉS ET CUIDITÉS AVEC OEUFS NON ASSAISONNÉES' pro_critere='X24' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='15'/>
		<z:row pro_numpro='2748' pro_nom='POIREAUX A LA GRECQUE' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='2744' pro_nom='MOUSSE DE FOIE DE CANARD (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='11'
			 pro_t4='1'/>
		<z:row pro_numpro='2743' pro_nom='MOUSSE DE FOIE DE PORC (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='11'
			 pro_t4='1'/>
		<z:row pro_numpro='2742' pro_nom='POULET EN GELÉE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='2741' pro_nom='POIVRONS CUITS ASSAISONNÉS' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='2739' pro_nom='GALETTE JAMBON AVEC FROMAGE A CUIRE' pro_critere='A5' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='9'/>
		<z:row pro_numpro='2736' pro_nom='BOISSON LACTÉE' pro_critere='O9' pro_t1='0' pro_t2='11' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2735' pro_nom='MINERAI DE BOEUF CRU' pro_critere='B1' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='2733' pro_nom='FAISAN ENTIER CRU' pro_critere='F5' pro_t1='0' pro_t2='2' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='2732' pro_nom='GÉNOISE A LA MOUSSE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='2724' pro_nom='ÉPAULE D&#x27;AGNEAU CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='2723' pro_nom='CARRÉ DE PORC CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='2720' pro_nom='GALANTINE DE JAMBON (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='12'
			 pro_t4='2'/>
		<z:row pro_numpro='2717' pro_nom='CUBE DE POISSON FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='2716' pro_nom='ÉPAULE DE PORC CRUE P' pro_critere='E1' pro_t1='0' pro_t2='1' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='2715' pro_nom='QUARTIER D&#x27;AGNEAU CRU P' pro_critere='D1' pro_t1='0' pro_t2='1' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='2714' pro_nom='PAIN AU CHOCOLAT CRU' pro_critere='A6' pro_t1='0' pro_t2='8' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='2713' pro_nom='BEIGNET AU CHOCOLAT' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='2712' pro_nom='MERINGUE ITALIENNE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2710' pro_nom='POIVRONS FARCIS CRUS' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='2708' pro_nom='BEIGNET DE FRUITS DE MER CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='3'/>
		<z:row pro_numpro='2707' pro_nom='BOUDIN BLANC BRIOCHÉ (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='13'
			 pro_t4='2'/>
		<z:row pro_numpro='2705' pro_nom='JARRET DE PORC SAUMURÉ CUIT (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='2704' pro_nom='PANSE DE PORC CUITE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='15'
			 pro_t4='2'/>
		<z:row pro_numpro='2703' pro_nom='DÉLICE POIRE CARAMEL' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='2702' pro_nom='HARICOTS ROUGES NON ASSAISONNÉS' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='2701' pro_nom='ÉCREVISSE CUITE DÉCORTIQUÉE SAUMURÉE' pro_critere='I3' pro_t1='0' pro_t2='3'
			 pro_t3='7' pro_t4='4'/>
		<z:row pro_numpro='2699' pro_nom='POITRINE DE PORC SAUMURÉE PRÉCUITE' pro_critere='F3' pro_t1='0' pro_t2='5'
			 pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='2696' pro_nom='CRUDITÉS ET FRUITS DE MER NON ASSAISONNÉS' pro_critere='X24' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='13'/>
		<z:row pro_numpro='2695' pro_nom='JAMBON AU FROMAGE CUISINÉ' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='2'/>
		<z:row pro_numpro='2689' pro_nom='STEAK DE POISSON SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='2680' pro_nom='FILET DE POISSON PANE AU FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='2678' pro_nom='GRILLADE D&#x27;AGNEAU CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='2677' pro_nom='FILET DE SÉBASTE FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='2667' pro_nom='TARTE FRANGIPANE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2663' pro_nom='SANDWICH AU FROMAGE FRAIS' pro_critere='A7' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='6'/>
		<z:row pro_numpro='2660' pro_nom='SAUCISSE DE FRANCFORT EN SALADE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='11'/>
		<z:row pro_numpro='2656' pro_nom='BROCHETTE DE MOUTON CRUE' pro_critere='F10' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='2655' pro_nom='BUCHETTE DE JAMBON CRU EN GELÉE' pro_critere='F3' pro_t1='0' pro_t2='8' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='2654' pro_nom='PILONS DE POULET CUIT FROID' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='9'
			 pro_t4='3'/>
		<z:row pro_numpro='2653' pro_nom='PAIN VIENNOIS PRÉCUIT' pro_critere='A6' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='2652' pro_nom='PIED DE VEAU RÉMOULADE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='5'/>
		<z:row pro_numpro='2649' pro_nom='PANSE DE BOEUF CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2643' pro_nom='CRUDITÉS ET CHARCUTERIE CUITE NON ASSAISONNÉES' pro_critere='X24' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='11'/>
		<z:row pro_numpro='2639' pro_nom='PATÉ DE CHEVREUIL (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='2633' pro_nom='CHOCOLAT' pro_critere='A1' pro_t1='0' pro_t2='12' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='2629' pro_nom='PATÉ DE TETE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='14' pro_t4='2'/>
		<z:row pro_numpro='2614' pro_nom='POISSON RECONSTITUÉ CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='2613' pro_nom='JAMBON MACÉDOINE DE LÉGUMES NON ASSAISONNÉS' pro_critere='X24' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='11'/>
		<z:row pro_numpro='2612' pro_nom='SALADE CUIDITÉS CRUDITÉS ET POISSON FUMÉ' pro_critere='X24' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='13'/>
		<z:row pro_numpro='2606' pro_nom='GOGUES (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='16' pro_t4='1'/>
		<z:row pro_numpro='2596' pro_nom='SAUCISSE BLANCHE PRÉCUITE' pro_critere='F4' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='7'/>
		<z:row pro_numpro='2595' pro_nom='ESCALOPE DE VOLAILLE PRÉCUITE' pro_critere='F17' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='3'/>
		<z:row pro_numpro='2591' pro_nom='BROCHETTE DE PORC CRUE' pro_critere='F10' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='3'/>
		<z:row pro_numpro='2584' pro_nom='RICOTTA AU LAIT PASTEURISÉ' pro_critere='P5' pro_t1='0' pro_t2='6' pro_t3='11'
			 pro_t4='1'/>
		<z:row pro_numpro='2573' pro_nom='HURE DE SAUMON' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='19' pro_t4='1'/>
		<z:row pro_numpro='2570' pro_nom='ÉPAULE DE BOEUF CRUE P' pro_critere='E1' pro_t1='0' pro_t2='1' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='2569' pro_nom='MOUILLE DE PORC CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='2565' pro_nom='SAUCE BOLOGNAISE AVEC FROMAGE CUISINÉE' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2564' pro_nom='PATES ET POISSON NON ASSAISONNÉS' pro_critere='X22' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='8'/>
		<z:row pro_numpro='2559' pro_nom='GUACAMOLE' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='18'/>
		<z:row pro_numpro='2558' pro_nom='SAUMONETTE FRAICHE' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='2557' pro_nom='MERGUEZ DE VEAU CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='2556' pro_nom='TARTELETTE AUX OIGNONS CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='8'/>
		<z:row pro_numpro='2554' pro_nom='MENU FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='2553' pro_nom='CRUDITÉS ET CRABE EN SALADE' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='13'/>
		<z:row pro_numpro='2551' pro_nom='PANINI JAMBON FROMAGE, A CUIRE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='7'/>
		<z:row pro_numpro='2548' pro_nom='VIANDE HACHÉE DE BOEUF PRÉCUITE' pro_critere='B1' pro_t1='0' pro_t2='9'
			 pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='2546' pro_nom='GÉNOISE CREME BAVAROISE S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='2544' pro_nom='POIS CHICHES NON ASSAISONNÉS' pro_critere='X4' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='2543' pro_nom='VIANDE DE BOEUF EN SALADE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='9'
			 pro_t4='1'/>
		<z:row pro_numpro='2541' pro_nom='STEAK HACHÉ D&#x27;AGNEAU CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='2538' pro_nom='TORTELLINIS PRÉCUITS' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='2536' pro_nom='FILET DE BOEUF CRU P' pro_critere='E1' pro_t1='0' pro_t2='1' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='2531' pro_nom='COEUR DE RUMSTECK CRU P' pro_critere='E1' pro_t1='0' pro_t2='1' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='2527' pro_nom='ENTRECOTE DE BOEUF CRUE P' pro_critere='E1' pro_t1='0' pro_t2='1' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='2525' pro_nom='BASSE COTE DE BOEUF CRUE P' pro_critere='E1' pro_t1='0' pro_t2='1' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='2524' pro_nom='PAVÉ D&#x27;ESPADON FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='2523' pro_nom='ABVT1 CARPE' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='2522' pro_nom='FILET DE POISSON PANÉ PRÉCUIT' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='2521' pro_nom='CUIDITÉS ET POISSON NON ASSAISONNÉS' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='14'/>
		<z:row pro_numpro='2520' pro_nom='CORDON BLEU DE LAPIN CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='2514' pro_nom='CERVELAS DE CHEVAL CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='2512' pro_nom='POMMES DE TERRE ET POISSON CUIT EN SALADE' pro_critere='X22' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='13'/>
		<z:row pro_numpro='2511' pro_nom='FROMAGE FRAIS DE VACHE AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6'
			 pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='2507' pro_nom='BULOTS CUITS FROIDS' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='2506' pro_nom='CLAFOUTIS A CUIRE' pro_critere='A6' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='2504' pro_nom='NAVETS RAPÉS MAYONNAISE' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='2503' pro_nom='TARTINE A LA CHARCUTERIE CRUE' pro_critere='F3' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='2502' pro_nom='SAUCISSE FUMÉE CRUE' pro_critere='F18' pro_t1='0' pro_t2='5' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='2500' pro_nom='SAINTE MAURE AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='2497' pro_nom='OEUFS DE LUMP SEMI CONSERVE' pro_critere='M1' pro_t1='0' pro_t2='3' pro_t3='11'
			 pro_t4='1'/>
		<z:row pro_numpro='2496' pro_nom='BOUFFIS FUMÉ' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='2494' pro_nom='COURGETTE CRUE EN RONDELLE' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='2493' pro_nom='SAUCISSE DE COUENNE CRUE' pro_critere='G1' pro_t1='0' pro_t2='5' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='2492' pro_nom='BOUDIN DE TETE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='14' pro_t4='1'/>
		<z:row pro_numpro='2489' pro_nom='SALAMI DE MOUTON' pro_critere='G1' pro_t1='0' pro_t2='5' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='2484' pro_nom='FILET D&#x27;ANCHOIS EN SALADE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='13'/>
		<z:row pro_numpro='2481' pro_nom='FROMAGE FRIT' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='2476' pro_nom='AILE DE POULET CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='2475' pro_nom='BAVAROIS DE LÉGUMES CUITS' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='2470' pro_nom='ÉMINCÉ DE POULET CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='3'/>
		<z:row pro_numpro='2468' pro_nom='BROCHETTE D&#x27;AGNEAU CRUE' pro_critere='F10' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='2467' pro_nom='ÉCHALOTE HACHÉE SURGELÉE' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='2464' pro_nom='APPAREIL A FLAN DE LÉGUMES' pro_critere='A5' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='2'/>
		<z:row pro_numpro='2462' pro_nom='ENDIVE ET FROMAGE NON ASSAISONNÉS' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='17'/>
		<z:row pro_numpro='2461' pro_nom='KNACK (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='2460' pro_nom='SAUCE VINAIGRETTE DÉCONDITIONNÉE, MANIPULÉE' pro_critere='A1' pro_t1='0'
			 pro_t2='8' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='2458' pro_nom='SAUCISSE DE JAMBON (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='2457' pro_nom='ESCALOPE DE VEAU AVEC JAMBON ET FROMAGE CUITE' pro_critere='Z5' pro_t1='0'
			 pro_t2='9' pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='2456' pro_nom='COEUR D&#x27;AGNEAU CRU (F)' pro_critere='B15' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='3'/>
		<z:row pro_numpro='2454' pro_nom='SOUFFLÉ GLACÉ' pro_critere='O1' pro_t1='0' pro_t2='10' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='2449' pro_nom='SOUFFLÉ AU FROMAGE BLANC' pro_critere='Z5' pro_t1='0' pro_t2='10' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='2440' pro_nom='COLLIER DE BOEUF CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='2430' pro_nom='TARTELETTE AU SAUMON CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='8'/>
		<z:row pro_numpro='2429' pro_nom='SANDWICH CUIT' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='4'/>
		<z:row pro_numpro='2426' pro_nom='GARDIANE DE TAUREAU CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='2412' pro_nom='CULOTTE D&#x27;AGNEAU CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='2409' pro_nom='CREPE CUITE NATURE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='2404' pro_nom='CHIPOLATA CUITE SOUS VIDE' pro_critere='A5' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='2403' pro_nom='QUICHE CRUE AU FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='6'
			 pro_t4='8'/>
		<z:row pro_numpro='2400' pro_nom='MÉDAILLON DE POISSON HACHÉ FRAIS' pro_critere='J2' pro_t1='0' pro_t2='3'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2397' pro_nom='GALETTE A LA VIANDE DE PORC CUITE' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='6'/>
		<z:row pro_numpro='2396' pro_nom='ÉMINCÉ D&#x27;AGNEAU CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='2394' pro_nom='CUISSE DE PINTADEAU CRUE' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='2393' pro_nom='SANDWICH JAMBON SEC ET FROMAGE' pro_critere='F3' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='2392' pro_nom='CHAIR D&#x27;ESCARGOT' pro_critere='L2' pro_t1='0' pro_t2='3' pro_t3='12'
			 pro_t4='1'/>
		<z:row pro_numpro='2387' pro_nom='GIGOLETTE DE VOLAILLE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='2384' pro_nom='ROTI DE VEAU CUIT AVEC FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='2383' pro_nom='QUASI DE PORC CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='2380' pro_nom='RAVIOLIS PRÉCUITS' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='2377' pro_nom='BEIGNET DE FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='2376' pro_nom='CERVELAS AU FROMAGE A CUIRE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='2374' pro_nom='DÉCOUPE DE POULET PRÉCUITE' pro_critere='F1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='3'/>
		<z:row pro_numpro='2371' pro_nom='SANDWICH JAMBON CUIT ET FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='3'/>
		<z:row pro_numpro='2370' pro_nom='GÉNOISE A LA GANACHE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='2364' pro_nom='RAVIOLIS CHINOIS' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='2362' pro_nom='BOUCHÉE CHINOISE CRUE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='6'
			 pro_t4='6'/>
		<z:row pro_numpro='2361' pro_nom='CARPACCIO DE THON' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='2360' pro_nom='CHOCOLAT FROID' pro_critere='O9' pro_t1='0' pro_t2='11' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2357' pro_nom='TOURNEDOS DE VOLAILLE AVEC FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2356' pro_nom='LONGE DE PORC CRUE P' pro_critere='E1' pro_t1='0' pro_t2='1' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='2354' pro_nom='SAUCISSE DE SANGLIER CUITE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='2353' pro_nom='VIANDE HACHÉE DE PORC TRAITÉE SALAISON CUITE (D)' pro_critere='A5' pro_t1='0'
			 pro_t2='9' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2352' pro_nom='PANINI AU FROMAGE, A CUIRE' pro_critere='A7' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='6'/>
		<z:row pro_numpro='2351' pro_nom='BLÉ ET FRUITS DE MER MAYONNAISE' pro_critere='X22' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='9'/>
		<z:row pro_numpro='2350' pro_nom='VIANDE CUITE EN GELÉE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='2349' pro_nom='PLAT CUISINÉ CHINOIS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='5'/>
		<z:row pro_numpro='2348' pro_nom='PANINI AU FROMAGE CUIT' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='6'/>
		<z:row pro_numpro='2347' pro_nom='HURE DE BOEUF (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='14' pro_t4='1'/>
		<z:row pro_numpro='2344' pro_nom='AILERON DE DINDE CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='2343' pro_nom='PETIT SALÉ DE PORC CRU' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='2342' pro_nom='PRÉPARATION HACHÉE DE BOEUF PRÉCUITE' pro_critere='B1' pro_t1='0' pro_t2='9'
			 pro_t3='4' pro_t4='3'/>
		<z:row pro_numpro='2341' pro_nom='POT AU FEU DE BOEUF CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='2340' pro_nom='TERRINE DE LÉGUMES AU FROMAGE (D)' pro_critere='A5' pro_t1='0' pro_t2='5'
			 pro_t3='20' pro_t4='1'/>
		<z:row pro_numpro='2339' pro_nom='CUISSE DE POULET FARCIE CRUE' pro_critere='F10' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='2338' pro_nom='PALERON DE BOEUF CRU P' pro_critere='E1' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='2337' pro_nom='FAUX FILET DE BOEUF CRU P' pro_critere='E1' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='2336' pro_nom='APPAREIL A CROQUE MONSIEUR' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='6'
			 pro_t4='8'/>
		<z:row pro_numpro='2335' pro_nom='BAVETTE D&#x27;ALOYAU DE BOEUF CRUE P' pro_critere='E1' pro_t1='0' pro_t2='1'
			 pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='2333' pro_nom='CHOU ROUGE RAPÉ ASSAISONNÉ' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='2332' pro_nom='GELÉE DÉSHYDRATÉE' pro_critere='A1' pro_t1='0' pro_t2='12' pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='2331' pro_nom='FILET DE LOUP SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='2329' pro_nom='RISOTTO DE LA MER CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='2326' pro_nom='ÉPAULE DE MOUTON CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='2323' pro_nom='PETIT SALÉ CUIT (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2321' pro_nom='MIXÉ DE LÉGUMES CUITS AVEC FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='9'
			 pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='2320' pro_nom='PRÉP. HACHÉE DE BOEUF CRUE TRAITÉE EN SALAISON' pro_critere='F4' pro_t1='0'
			 pro_t2='5' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='2319' pro_nom='GRAS DE PORC CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='2318' pro_nom='SAUCISSE CUITE FUMÉE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='8'
			 pro_t4='2'/>
		<z:row pro_numpro='2317' pro_nom='RISSOLETTE DE VEAU PANÉE CRUE TRAITÉE EN SALAISON' pro_critere='F4' pro_t1='0'
			 pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='2316' pro_nom='PAUPIETTE DE BOEUF CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='2314' pro_nom='PAUPIETTE DE VOLAILLE AVEC FROMAGE CUISINÉE' pro_critere='Z5' pro_t1='0'
			 pro_t2='9' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='2309' pro_nom='AILERON DE DINDONNEAU CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='2307' pro_nom='SAUCISSE D&#x27;AGNEAU CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='2306' pro_nom='VOLAILLE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='2305' pro_nom='VIANDE DE VOLAILLE CRUE SÉPARÉE MÉCANIQUEMENT' pro_critere='B6' pro_t1='0'
			 pro_t2='2' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='2304' pro_nom='JAMBON CRU EN SALADE' pro_critere='F3' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='11'/>
		<z:row pro_numpro='2303' pro_nom='COTTY SALÉ CRU' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='2302' pro_nom='PORCELET FARCI (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='12' pro_t4='1'/>
		<z:row pro_numpro='2301' pro_nom='BEIGNET DE GAMBAS CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='6'/>
		<z:row pro_numpro='2300' pro_nom='MORUE DESSALÉE' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='2299' pro_nom='JAMBON CUIT BRUNI (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2298' pro_nom='TARTE CREME ALSACIENNE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='2293' pro_nom='COUENNE CUITE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2292' pro_nom='CUISSE DE GRENOUILLE CRUE' pro_critere='L1' pro_t1='0' pro_t2='3' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='2291' pro_nom='MOUSSAKA CUISINÉE AVEC FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='2290' pro_nom='TRAIMING DE PORC CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='2288' pro_nom='CHAPELURE' pro_critere='A1' pro_t1='0' pro_t2='12' pro_t3='3' pro_t4='4'/>
		<z:row pro_numpro='2281' pro_nom='FLANCHET DE BOEUF CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='2274' pro_nom='BARDIERE DE PORC CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='2273' pro_nom='CORDON BLEU DE DINDONNEAU CRU' pro_critere='F10' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='2270' pro_nom='GRENOUILLE FRAICHE' pro_critere='L1' pro_t1='0' pro_t2='3' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='2269' pro_nom='FLANCHET DE VEAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='2268' pro_nom='CHOU VERT CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='2267' pro_nom='GRATONS (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='22' pro_t4='1'/>
		<z:row pro_numpro='2266' pro_nom='GRAS DUR DE PORC CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='2265' pro_nom='TERRINE DE BOEUF(F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='2264' pro_nom='SANDWICH OEUF ET JAMBON FUMÉ' pro_critere='F3' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='7'/>
		<z:row pro_numpro='2263' pro_nom='CHAIR DE CRABE CUITE FROIDE' pro_critere='I4' pro_t1='0' pro_t2='8' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='2259' pro_nom='SAUCE CUISINÉE AVEC FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='9' pro_t3='9'
			 pro_t4='7'/>
		<z:row pro_numpro='2258' pro_nom='COEUR DE TENDE DE TRANCHE DE BOEUF CRU P' pro_critere='E1' pro_t1='0' pro_t2='1'
			 pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='2255' pro_nom='IMPÉRIAL CREME CHANTILLY S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='2254' pro_nom='VIANDE DE BICHE CRUE' pro_critere='B2' pro_t1='0' pro_t2='2' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='2252' pro_nom='MÉDAILLON DE LAPIN (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='2251' pro_nom='QUEUE DE TRUITE SAUMONÉE FRAICHE' pro_critere='J1' pro_t1='0' pro_t2='3'
			 pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='2250' pro_nom='CROISSANT CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='2249' pro_nom='ESCARGOTS CUITS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='2248' pro_nom='PAIN CUIT' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2245' pro_nom='CERF CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='2243' pro_nom='TARTELETTE A L&#x27;ORANGE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='2242' pro_nom='TOURNEDOS DE BICHE CRU' pro_critere='B2' pro_t1='0' pro_t2='2' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='2237' pro_nom='CUBE DE POISSON SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='2236' pro_nom='ESCALOPE DE TRUITE SAUMONÉE FRAICHE' pro_critere='J1' pro_t1='0' pro_t2='3'
			 pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='2229' pro_nom='SALADE CUIDITÉS CRUDITÉS AUX GÉSIERS' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='5'/>
		<z:row pro_numpro='2226' pro_nom='PRÉLEVEMENT SUR CARCASSE DE BOEUF P' pro_critere='D1' pro_t1='0' pro_t2='1'
			 pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='2224' pro_nom='ROUILLE &#x22;MAISON&#x22;' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='2223' pro_nom='CREME PATISSIERE A CHAUD AU MASCARPONE' pro_critere='P3' pro_t1='0' pro_t2='10'
			 pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='2218' pro_nom='SURIMI ASSAISONNÉ' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='6'/>
		<z:row pro_numpro='2216' pro_nom='BUCHETTE MOUSSE DE JAMBON EN GELÉE' pro_critere='A5' pro_t1='0' pro_t2='8'
			 pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='2215' pro_nom='JARRET DE PORC CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='2213' pro_nom='VIANDE CRUE POUR ANIMAUX' pro_critere='B2' pro_t1='0' pro_t2='13' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='2212' pro_nom='CAILLE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='2211' pro_nom='AVOCAT ET MACÉDOINE DE LÉGUMES ASSAISONNÉS' pro_critere='X6' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='6'/>
		<z:row pro_numpro='2209' pro_nom='RAVIOLES AU FROMAGE CUITS' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='4'/>
		<z:row pro_numpro='2202' pro_nom='PRÉPARATION HACHÉE DE PORC PANÉE TRAITÉE SAL. PRÉCUITE' pro_critere='F4'
			 pro_t1='0' pro_t2='9' pro_t3='6' pro_t4='7'/>
		<z:row pro_numpro='2197' pro_nom='FILET DE LOUP DE MER SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='2194' pro_nom='CONFIT DE VOLAILLE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='9'
			 pro_t4='1'/>
		<z:row pro_numpro='2192' pro_nom='QUICHE AUX CHAMPIGNONS CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='8'/>
		<z:row pro_numpro='2191' pro_nom='MOZZARELLA AU LAIT PASTEURISÉ' pro_critere='O7' pro_t1='0' pro_t2='6' pro_t3='6'
			 pro_t4='2'/>
		<z:row pro_numpro='2189' pro_nom='FROMAGE FRAIS DE BREBIS AU LAIT PASTEURISÉ' pro_critere='O3' pro_t1='0' pro_t2='6'
			 pro_t3='6' pro_t4='2'/>
		<z:row pro_numpro='2186' pro_nom='SAUCISSE A CUIRE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='2185' pro_nom='SANDWICH CRUDITÉS ET KAMABOKO' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='4'/>
		<z:row pro_numpro='2183' pro_nom='CIBOULETTE FRAICHE' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='2' pro_t4='7'/>
		<z:row pro_numpro='2182' pro_nom='ROTI DE POULET SAUMURÉ CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='2181' pro_nom='TARTE A L&#x27;OIGNON ET LARDONS PRÉCUITE' pro_critere='A5' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='8'/>
		<z:row pro_numpro='2180' pro_nom='JAMBONNEAU DE PORC SALÉ CRU' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='2179' pro_nom='NUGGET&#x27;S DE DINDE CUITS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='2178' pro_nom='LONGE DE VEAU CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='2175' pro_nom='BLANC DE VOLAILLE TRAITÉ EN SALAISON CUIT (D)' pro_critere='A5' pro_t1='0'
			 pro_t2='5' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2174' pro_nom='MOUSSE DE VOLAILLE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='11'
			 pro_t4='1'/>
		<z:row pro_numpro='2172' pro_nom='STICK DE VOLAILLE PANÉ CRU' pro_critere='F2' pro_t1='0' pro_t2='2' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='2171' pro_nom='PRÉP. HACHÉE DE PORC CRUE TRAITÉE EN SALAISON' pro_critere='F4' pro_t1='0'
			 pro_t2='5' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='2169' pro_nom='BEURRE PERSILLÉ' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='2166' pro_nom='CREPE BÉCHAMEL AU FROMAGE ET AU JAMBON CUITE' pro_critere='Z5' pro_t1='0'
			 pro_t2='8' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='2165' pro_nom='MIXÉ DE POISSON CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='6'/>
		<z:row pro_numpro='2162' pro_nom='SAUTÉ DE LAPIN SAUMURÉ CRU' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='2161' pro_nom='GOUGERE A LA VIANDE CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='2159' pro_nom='LANGUE DE PORC SAUMURÉE CUITE (F)' pro_critere='A5' pro_t1='0' pro_t2='5'
			 pro_t3='14' pro_t4='1'/>
		<z:row pro_numpro='2158' pro_nom='MIXÉ DE CRUDITÉS ASSAISONNÉES' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='2155' pro_nom='LANGUE DE BOEUF CUITE FUMÉE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='14'
			 pro_t4='1'/>
		<z:row pro_numpro='2154' pro_nom='MOUSSE DE HOMARD' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='19' pro_t4='1'/>
		<z:row pro_numpro='2150' pro_nom='DÉCOUPE D&#x27;AUTRUCHE CRUE' pro_critere='F17' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='2143' pro_nom='HARICOTS BEURRE SURGELÉS' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='2142' pro_nom='BUCHE A LA MOUSSE AUX FRUITS' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='2140' pro_nom='PRÉPARATION HACHÉE DE VOLAILLE CRUE TRAITÉE EN SALAISON' pro_critere='F2'
			 pro_t1='0' pro_t2='5' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='2139' pro_nom='DARNE DE TURBOT SURGELÉE' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='2138' pro_nom='RIZ ET VOLAILLE EN SALADE' pro_critere='X22' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='9'/>
		<z:row pro_numpro='2137' pro_nom='BURITO AU POULET CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4' pro_t4='3'/>
		<z:row pro_numpro='2136' pro_nom='MACARON A LA CREME CHANTILLY S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='2134' pro_nom='SAUTÉ DE SANGLIER CRU' pro_critere='B2' pro_t1='0' pro_t2='2' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='2132' pro_nom='GNOCCHIS AVEC FROMAGE A CUIRE' pro_critere='A5' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='7'/>
		<z:row pro_numpro='2123' pro_nom='BUCHETTE FRUITS DE MER EN GELÉE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='2122' pro_nom='COQUILLE SAUMON MACÉDOINE' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='13'/>
		<z:row pro_numpro='2120' pro_nom='PAVÉ DE TRUITE FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='2119' pro_nom='VENTRE DE VEAU CUISINÉ (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='15'
			 pro_t4='1'/>
		<z:row pro_numpro='2118' pro_nom='SANDWICH OEUF MAYONNAISE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='7'/>
		<z:row pro_numpro='2117' pro_nom='CRUDITÉS ET THON NON ASSAISONNÉS' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='6'/>
		<z:row pro_numpro='2115' pro_nom='CAROTTES CUITES NON ASSAISONNÉES' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='2114' pro_nom='VÉNUS' pro_critere='K1' pro_t1='0' pro_t2='3' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='2112' pro_nom='POUDRE POUR MOUSSE AU CHOCOLAT' pro_critere='P1' pro_t1='0' pro_t2='12' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='2111' pro_nom='CHOU VERT' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='2107' pro_nom='ESCALOPE DE SAUMON CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='2106' pro_nom='FILET DE BROSME FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='2105' pro_nom='ABVT1 FILET DE BROSME' pro_critere='V12' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='2104' pro_nom='CHEESECAKE' pro_critere='Z5' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2101' pro_nom='BALLOTTINE DE PORC (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='12'
			 pro_t4='2'/>
		<z:row pro_numpro='2100' pro_nom='GATEAU AUX MARRONS' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2099' pro_nom='FROMAGE A PATE PRESSÉE CUITE AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6'
			 pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='2098' pro_nom='LANGOUSTE CUITE' pro_critere='A1' pro_t1='0' pro_t2='3' pro_t3='7' pro_t4='3'/>
		<z:row pro_numpro='2091' pro_nom='TERRINE DE FRUITS' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='2090' pro_nom='CANTAL AU LAIT PASTEURISÉ' pro_critere='P5' pro_t1='0' pro_t2='6' pro_t3='10'
			 pro_t4='2'/>
		<z:row pro_numpro='2089' pro_nom='DEMI LANGOUSTE CUITE' pro_critere='A1' pro_t1='0' pro_t2='3' pro_t3='7' pro_t4='3'/>
		<z:row pro_numpro='2088' pro_nom='CHAUSSON AUX CREVETTES CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='3'/>
		<z:row pro_numpro='2087' pro_nom='BUCHE CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='2086' pro_nom='FILET DE PORC CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='2085' pro_nom='POUDRE D&#x27;AMANDE' pro_critere='A1' pro_t1='0' pro_t2='12' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='2084' pro_nom='PAILLETINE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='2082' pro_nom='BOEUF EN GELÉE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='2080' pro_nom='VELOUTÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='2079' pro_nom='QUEUE DE LANGOUSTE CUITE' pro_critere='I2' pro_t1='0' pro_t2='3' pro_t3='7'
			 pro_t4='3'/>
		<z:row pro_numpro='2077' pro_nom='PERSIL DÉSHYDRATÉ' pro_critere='U3' pro_t1='0' pro_t2='4' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='2075' pro_nom='OMELETTE AVEC FROMAGE FROIDE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='15'/>
		<z:row pro_numpro='2073' pro_nom='ESCALOPE DE VOLAILLE JAMBON ET FROMAGE A CUIRE' pro_critere='F10' pro_t1='0'
			 pro_t2='2' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='2071' pro_nom='PAIN DE COTE CUIT (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2070' pro_nom='OSSO BUCCO DE DINDE CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='2069' pro_nom='FOURME DE MONTBRISON AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='2068' pro_nom='POMMES CRUES AU CURRY' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='2067' pro_nom='POISSON EN GRATIN AVEC FROMAGE A CUIRE' pro_critere='A5' pro_t1='0' pro_t2='9'
			 pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='2066' pro_nom='FOIE GRAS DE CANARD EN SEMI CONSERVE' pro_critere='M1' pro_t1='0' pro_t2='5'
			 pro_t3='21' pro_t4='1'/>
		<z:row pro_numpro='2064' pro_nom='TARTELETTE A LA MOUSSE AU CHOCOLAT' pro_critere='P1' pro_t1='0' pro_t2='10'
			 pro_t3='2' pro_t4='4'/>
		<z:row pro_numpro='2062' pro_nom='LARD CUIT (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2059' pro_nom='PEAU DE COU DE POULET' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='2058' pro_nom='MAKROUT' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2057' pro_nom='VIANDE D&#x27;ÉPAULE DE DINDE CRUE' pro_critere='F17' pro_t1='0' pro_t2='5'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2052' pro_nom='VIANDE DE CUISSE DE DINDE CRUE' pro_critere='F17' pro_t1='0' pro_t2='5' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='2051' pro_nom='ROULÉ DE DINDE CRU' pro_critere='F17' pro_t1='0' pro_t2='5' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='2050' pro_nom='ROTI FILET DE DINDE CRU' pro_critere='F17' pro_t1='0' pro_t2='5' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='2049' pro_nom='CREME MATURÉE VRAC (F)' pro_critere='O13' pro_t1='0' pro_t2='6' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='2048' pro_nom='LAIT CRU JOUR DE PRODUCTION OU CONDITIONNEMENT' pro_critere='N9' pro_t1='0'
			 pro_t2='6' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='2047' pro_nom='LAIT PASTEURISÉ STADE PRODUCTION' pro_critere='N11' pro_t1='0' pro_t2='6'
			 pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='2043' pro_nom='DÉCOUPE DE CHEVAL CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='5'/>
		<z:row pro_numpro='2042' pro_nom='SAUCE COCKTAIL DÉCONDITIONNÉE, MANIPULÉE' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='2041' pro_nom='BOUCHÉE A LA VOLAILLE CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='2040' pro_nom='RIZ ET CREVETTES EN SALADE' pro_critere='X22' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='4'/>
		<z:row pro_numpro='2039' pro_nom='STEAK HACHÉ DE TRUITE FRAIS' pro_critere='J2' pro_t1='0' pro_t2='3' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='2035' pro_nom='PARIS BREST CREME CHANTILLY P' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='2029' pro_nom='GARDIANE DE BOEUF CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='2027' pro_nom='FILET DE CARPE FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='2025' pro_nom='FOIE DE PORC CRU (D)' pro_critere='B16' pro_t1='0' pro_t2='1' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='2023' pro_nom='SAUCISSE DE TOULOUSE CUITE SOUS VIDE' pro_critere='A5' pro_t1='0' pro_t2='9'
			 pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='2022' pro_nom='FILET DE PLIE SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='2017' pro_nom='FARCE A RAVIOLI CUITE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='22'
			 pro_t4='1'/>
		<z:row pro_numpro='2016' pro_nom='ROULÉ AU FROMAGE A CUIRE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='2015' pro_nom='SAUCE INSTANTANÉE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='9'
			 pro_t4='4'/>
		<z:row pro_numpro='2014' pro_nom='PATES ET CUIDITÉS NON ASSAISONNÉES' pro_critere='X4' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='8'/>
		<z:row pro_numpro='2013' pro_nom='PIED DE PORC AU VINAIGRE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='14'
			 pro_t4='2'/>
		<z:row pro_numpro='2009' pro_nom='PAVÉ DE TRUITE SAUMONÉE SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3'
			 pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='2006' pro_nom='OREILLE DE PORC CUITE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='14'
			 pro_t4='1'/>
		<z:row pro_numpro='2005' pro_nom='SAUTÉ DE KANGOUROU CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='2003' pro_nom='LARD FUMÉ CRU' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='2002' pro_nom='PAVÉ DE LOUP SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='1989' pro_nom='OIGNONS SURGELÉS' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='1988' pro_nom='JAMBONNETTE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='1987' pro_nom='POULARDE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='1983' pro_nom='NUGGET&#x27;S PRÉCUITS' pro_critere='F2' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='5'/>
		<z:row pro_numpro='1982' pro_nom='NUGGET&#x27;S DE VOLAILLE CUITS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='1981' pro_nom='MOULINÉ DE CHARCUTERIES CUITES (D)' pro_critere='A5' pro_t1='0' pro_t2='5'
			 pro_t3='22' pro_t4='1'/>
		<z:row pro_numpro='1977' pro_nom='BIFTECK DE TAUREAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='1976' pro_nom='JAMBON SALÉ CRU' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='1975' pro_nom='HACHAGE DE PORC CRU' pro_critere='B1' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='1972' pro_nom='COCHON ROTI' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='1970' pro_nom='ASPIC JAMBON CRU' pro_critere='F3' pro_t1='0' pro_t2='8' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='1964' pro_nom='CREPE A LA GANACHE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='1963' pro_nom='TRIANGLE AUX AMANDES CRU' pro_critere='A6' pro_t1='0' pro_t2='8' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='1962' pro_nom='CREPE A LA CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='1957' pro_nom='AZURÉENNE CREME CHANTILLY S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='1953' pro_nom='PARIS BREST CREME MOUSSELINE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='1952' pro_nom='RACLETTE AU LAIT PASTEURISÉ' pro_critere='P5' pro_t1='0' pro_t2='6' pro_t3='9'
			 pro_t4='2'/>
		<z:row pro_numpro='1951' pro_nom='ÉCHALOTE HACHÉE' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='2' pro_t4='5'/>
		<z:row pro_numpro='1950' pro_nom='MAIGRE DE BOEUF CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='1948' pro_nom='PALOURDE CUITE FROIDE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='1947' pro_nom='ASPIC AU SAUMON FUMÉ' pro_critere='A8' pro_t1='0' pro_t2='8' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='1946' pro_nom='CONFIT DE CUISSE DE CANARD (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='9'
			 pro_t4='1'/>
		<z:row pro_numpro='1945' pro_nom='VIANDE DE PORC SÉCHÉE' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='1934' pro_nom='TARTE FLAMBÉE (FLAMMENKUECHE) CUITE' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='8'/>
		<z:row pro_numpro='1933' pro_nom='TACCOS CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='1931' pro_nom='AIOLI &#x22;MAISON&#x22;' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='1929' pro_nom='CERVELLE DE VEAU CRUE (F)' pro_critere='B15' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='1927' pro_nom='GOULASCH DE BOEUF AVEC FROMAGE CUISINÉE' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='1925' pro_nom='ROULEAU DE SAUMON CUIT FROID' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='1924' pro_nom='TOURTE AUX LARDONS CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='4'/>
		<z:row pro_numpro='1921' pro_nom='BLOC DE FOIE GRAS SEMI-CONSERVE' pro_critere='M1' pro_t1='0' pro_t2='5' pro_t3='21'
			 pro_t4='1'/>
		<z:row pro_numpro='1920' pro_nom='ROND DE GITE CRU P' pro_critere='E1' pro_t1='0' pro_t2='1' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='1919' pro_nom='PAPOUTZAKIA CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='1918' pro_nom='MAROILLES AU LAIT PASTEURISÉ' pro_critere='O7' pro_t1='0' pro_t2='6' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='1912' pro_nom='BUCHETTE AU LAIT PASTEURISÉ DE MÉLANGE' pro_critere='O7' pro_t1='0' pro_t2='6'
			 pro_t3='7' pro_t4='2'/>
		<z:row pro_numpro='1910' pro_nom='POITRINE DE MOUTON CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='1909' pro_nom='SELLES SUR CHER AU LAIT PASTEURISÉ' pro_critere='O7' pro_t1='0' pro_t2='6'
			 pro_t3='6' pro_t4='2'/>
		<z:row pro_numpro='1907' pro_nom='APPAREIL A SOUFFLÉ' pro_critere='A5' pro_t1='0' pro_t2='10' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='1902' pro_nom='PRÉP. A BASE DE CHAIR DE POISSON HACHÉE CRUE SURGELÉE' pro_critere='J5'
			 pro_t1='0' pro_t2='3' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='1901' pro_nom='POITRINE DE PORC CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='5'/>
		<z:row pro_numpro='1900' pro_nom='LAIT STÉRILISÉ STADE PRODUCTION' pro_critere='N10' pro_t1='0' pro_t2='6'
			 pro_t3='1' pro_t4='6'/>
		<z:row pro_numpro='1898' pro_nom='GRATON LYONNAIS (D)' pro_critere='A5' pro_t1='0' pro_t2='9' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='1897' pro_nom='SEMOULE NON ASSAISONNÉE' pro_critere='X4' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='8'/>
		<z:row pro_numpro='1896' pro_nom='LANGUE DE PORC CUITE FROIDE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='9'
			 pro_t4='4'/>
		<z:row pro_numpro='1895' pro_nom='OMELETTE DE POISSON CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='2'/>
		<z:row pro_numpro='1894' pro_nom='LANGUE DE BOEUF CRUE (F)' pro_critere='B15' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='1893' pro_nom='FEUILLETÉ CRU A LA SAUCISSE CUITE' pro_critere='A5' pro_t1='0' pro_t2='8'
			 pro_t3='6' pro_t4='4'/>
		<z:row pro_numpro='1892' pro_nom='FRITES FRAICHES PRÉCUITES' pro_critere='A9' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='3'/>
		<z:row pro_numpro='1891' pro_nom='ROTI DE BOEUF FARCI CRU' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='1889' pro_nom='ROTI DE PORC FARCI CRU' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='1887' pro_nom='MUFFIN' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='1886' pro_nom='ABVT1 PAGEOT' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='1882' pro_nom='COQUILLE DE POISSON CUISINÉE AVEC FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='9'
			 pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='1871' pro_nom='FRITONS DE PORC (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='14' pro_t4='1'/>
		<z:row pro_numpro='1870' pro_nom='STEAK TARTARE DE BISON CRU' pro_critere='B1' pro_t1='0' pro_t2='1' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='1867' pro_nom='PAVÉ DE SAUMON SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='1864' pro_nom='FLAN AUX FOIES DE VOLAILLE CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='1862' pro_nom='BOUCHÉE A LA VIANDE AVEC FROMAGE CUITE' pro_critere='Z5' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='9'/>
		<z:row pro_numpro='1861' pro_nom='CREVETTES CRUES DÉCORTIQUÉES SURGELÉES (F)' pro_critere='I8' pro_t1='0'
			 pro_t2='3' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='1860' pro_nom='CREVETTES CUITES DÉCORTIQUÉES SURGELÉES (F)' pro_critere='I3' pro_t1='0'
			 pro_t2='3' pro_t3='7' pro_t4='4'/>
		<z:row pro_numpro='1859' pro_nom='FRIAND AU THON CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='5'/>
		<z:row pro_numpro='1858' pro_nom='POTAGE DE LEGUMES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='1857' pro_nom='BEURRE AU LAIT CRU' pro_critere='Q2' pro_t1='0' pro_t2='6' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='1856' pro_nom='CREVETTES ENTIERES CUITES SURGELÉES' pro_critere='I2' pro_t1='0' pro_t2='3'
			 pro_t3='7' pro_t4='3'/>
		<z:row pro_numpro='1847' pro_nom='SALADE MÉLANGÉE 4G (F)' pro_critere='X1' pro_t1='0' pro_t2='4' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='1846' pro_nom='BLÉ ET CUIDITÉS EN SALADE' pro_critere='X4' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='4'/>
		<z:row pro_numpro='1841' pro_nom='ÉPINARDS CRUS' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='1840' pro_nom='FEUILLETÉ VIANDE FROMAGE BÉCHAMEL CUIT' pro_critere='Z5' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='1837' pro_nom='GATEAU AUX CAROTTES' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='1836' pro_nom='JAMBON DE REIMS (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='1834' pro_nom='VACHERIN MONT D&#x27;OR AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6'
			 pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='1826' pro_nom='PIGEONNEAU ENTIER CRU' pro_critere='F5' pro_t1='0' pro_t2='2' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='1824' pro_nom='COTE DE PORC CUITE TRAITÉE EN SALAISON (D)' pro_critere='A5' pro_t1='0' pro_t2='5'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='1823' pro_nom='GALETTE DE BLÉ COMPOSÉE CUIDITÉS, CUITE ET FROMAGE, A CUIRE' pro_critere='A5'
			 pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='9'/>
		<z:row pro_numpro='1815' pro_nom='FILET MIGNON DE PORC PRÉCUIT' pro_critere='B2' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='4'/>
		<z:row pro_numpro='1814' pro_nom='BLÉ AU LAIT' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='1813' pro_nom='CRABE CUIT' pro_critere='A1' pro_t1='0' pro_t2='3' pro_t3='7' pro_t4='3'/>
		<z:row pro_numpro='1811' pro_nom='HACHÉ D&#x27;AGNEAU CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='1810' pro_nom='POLJEVLEESCH CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='1809' pro_nom='CRÉPINETTE DE PORC PRÉCUITE' pro_critere='F4' pro_t1='0' pro_t2='9' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='1798' pro_nom='KOUING AMAN' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='1796' pro_nom='SOURIS D&#x27;AGNEAU CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='1794' pro_nom='SANDWICH A LA COPPA' pro_critere='F3' pro_t1='0' pro_t2='8' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='1791' pro_nom='CORDON BLEU DE VOLAILLE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='1789' pro_nom='PAVÉ DE SAUMON FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='1782' pro_nom='GRATIN DE POISSON CUISINÉ AVEC FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='9'
			 pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='1781' pro_nom='GALETTE DE BLÉ A LA VIANDE CUITE ET FROMAGE, A CUIRE' pro_critere='A5' pro_t1='0'
			 pro_t2='8' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='1778' pro_nom='SANG FRAIS A LA SAIGNÉE' pro_critere='B3' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='3'/>
		<z:row pro_numpro='1777' pro_nom='GRAISSE ANIMALE NON FONDUE' pro_critere='S1' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='6'/>
		<z:row pro_numpro='1776' pro_nom='POUDRE POUR MOUSSE INSTANTANÉE' pro_critere='P1' pro_t1='0' pro_t2='12' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='1774' pro_nom='JÉSUS SEC' pro_critere='G1' pro_t1='0' pro_t2='5' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='1773' pro_nom='ESCALOPE DE SAUMON FRAICHE' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='1771' pro_nom='TRIPES DE BOEUF CRUES' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='1770' pro_nom='SAUCE ROUILLE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='9' pro_t4='4'/>
		<z:row pro_numpro='1769' pro_nom='ESCALOPE DE DINDE MILANAISE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='1768' pro_nom='BRANDADE DE MORUE SEMI CONSERVE' pro_critere='M1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='1767' pro_nom='NID D&#x27;ABEILLE CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10'
			 pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='1766' pro_nom='FILET DE LOUP DE MER FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='1765' pro_nom='PRÉPARATION A BASE DE SURIMI' pro_critere='A1' pro_t1='0' pro_t2='3' pro_t3='9'
			 pro_t4='1'/>
		<z:row pro_numpro='1762' pro_nom='TOURNEDOS DE CANARD CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='1758' pro_nom='JAMBON A TARTINER (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='1757' pro_nom='JÉSUS CUIT (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='1756' pro_nom='CAPPELLETIS CUITS AVEC FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='4'/>
		<z:row pro_numpro='1753' pro_nom='TORTILLAS CUITS' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='6'/>
		<z:row pro_numpro='1752' pro_nom='PATE DE COING' pro_critere='A1' pro_t1='0' pro_t2='12' pro_t3='2' pro_t4='4'/>
		<z:row pro_numpro='1751' pro_nom='CHARCUTERIE CUITE ET OEUFS DURS EN SALADE' pro_critere='A5' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='7'/>
		<z:row pro_numpro='1749' pro_nom='HURE DE SANGLIER (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='14' pro_t4='2'/>
		<z:row pro_numpro='1747' pro_nom='JOUE DE MORUE SALÉE' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='1746' pro_nom='ABVT1 SAINT PIERRE' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='1742' pro_nom='SALADE CUIDITÉS CRUDITÉS ET CREVETTES' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='13'/>
		<z:row pro_numpro='1740' pro_nom='SAUTÉ DE MOUTON CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='4'/>
		<z:row pro_numpro='1732' pro_nom='SAUCE RÉMOULADE &#x22;MAISON&#x22;' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='1730' pro_nom='ASPIC DE LÉGUMES CUITS' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='1728' pro_nom='POMMES DE TERRE ET CUIDITÉS EN SALADE' pro_critere='X4' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='1727' pro_nom='TRAIMING DE BOEUF CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='1726' pro_nom='PAIN SAUCE BOLOGNAISE ET FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='4'/>
		<z:row pro_numpro='1717' pro_nom='COQUILLE AUX CREVETTES CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='6'/>
		<z:row pro_numpro='1715' pro_nom='RILLETTES DE CANARD (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='9'
			 pro_t4='2'/>
		<z:row pro_numpro='1708' pro_nom='PANINI VIANDE FROMAGE A CUIRE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='7'/>
		<z:row pro_numpro='1707' pro_nom='APPENZELLER AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='1706' pro_nom='ABVT1 FILET D&#x27;EMPEREUR' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='1705' pro_nom='DÉCOUPE DE CANARD CRUE' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='1702' pro_nom='ROULÉ AUX AMANDES' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='1701' pro_nom='CAKE AU THON CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='4'/>
		<z:row pro_numpro='1698' pro_nom='ABVT1 FILET DE HOKI' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='1695' pro_nom='ABVT1 DARNE DE BONITE' pro_critere='V14' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='1690' pro_nom='DARNE DE BONITE FRAICHE' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='1687' pro_nom='ROTI DE LAPIN FARCI PRÉCUIT' pro_critere='F10' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='6'/>
		<z:row pro_numpro='1686' pro_nom='MINERAI DE CHEVAL CRU' pro_critere='B1' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='5'/>
		<z:row pro_numpro='1684' pro_nom='FIGATELLI' pro_critere='G1' pro_t1='0' pro_t2='5' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='1683' pro_nom='TETE DE PORC EN SALADE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='12'/>
		<z:row pro_numpro='1682' pro_nom='APPAREIL CRU A QUENELLES DE SAUMON' pro_critere='A5' pro_t1='0' pro_t2='5'
			 pro_t3='18' pro_t4='1'/>
		<z:row pro_numpro='1680' pro_nom='FILET DE SARDINE MARINÉ' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='1679' pro_nom='ABVT1 FILET DE SÉBASTE' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='1678' pro_nom='DINDONNEAU CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='1676' pro_nom='TARTE A LA RHUBARBE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='1668' pro_nom='GALETTE AU POULET CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='9'/>
		<z:row pro_numpro='1666' pro_nom='CUIDITÉS CRUDITÉS ET SALAMI NON ASSAISONNÉS' pro_critere='X28' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='11'/>
		<z:row pro_numpro='1665' pro_nom='SALADE COMPOSÉE CRUDITÉS ET CUIDITÉS AVEC FROMAGE' pro_critere='X24' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='6'/>
		<z:row pro_numpro='1662' pro_nom='CROQUETTE DE CREVETTES CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='1659' pro_nom='BROCHETTE DE FRUITS FRAIS' pro_critere='X3' pro_t1='0' pro_t2='10' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='1657' pro_nom='ÉPAULE D&#x27;AGNEAU CRUE FARCIE' pro_critere='F4' pro_t1='0' pro_t2='5'
			 pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='1653' pro_nom='VIANDE DE CHEVAL A HACHER CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='1652' pro_nom='HOMARD CUIT FROID' pro_critere='I2' pro_t1='0' pro_t2='8' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='1649' pro_nom='NAPPAGE CHOCOLAT' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='1647' pro_nom='SOUPE DE FRUITS FRAIS' pro_critere='X3' pro_t1='0' pro_t2='10' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='1646' pro_nom='TARTE AU FRUITS MERINGUÉE CUITE' pro_critere='P1' pro_t1='0' pro_t2='10'
			 pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='1645' pro_nom='PIGNONS DE PIN' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='8' pro_t4='5'/>
		<z:row pro_numpro='1644' pro_nom='OEUFS ENTIERS EN POUDRE' pro_critere='A1' pro_t1='0' pro_t2='7' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='1638' pro_nom='MACREUSE DE BOEUF CRUE P' pro_critere='E1' pro_t1='0' pro_t2='1' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='1637' pro_nom='CORDON BLEU DE VOLAILLE PRÉFRIT' pro_critere='F10' pro_t1='0' pro_t2='2'
			 pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='1634' pro_nom='BAVAROIS DE SAUMON FUMÉ' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='1632' pro_nom='BLÉ EN SALADE' pro_critere='X4' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='9'/>
		<z:row pro_numpro='1631' pro_nom='TENDE DE TRANCHE DE CHEVAL CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='5'/>
		<z:row pro_numpro='1627' pro_nom='SANG DE PORC FRAIS (D)' pro_critere='B4' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='1617' pro_nom='CORDON BLEU DE DINDE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='1615' pro_nom='MOUSSE DE VOLAILLE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='1611' pro_nom='VIANDE DE DINDE CRUE SÉPARÉE MÉCANIQUEMENT' pro_critere='B6' pro_t1='0'
			 pro_t2='2' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='1609' pro_nom='CHAIR DE CRABE CUITE' pro_critere='I4' pro_t1='0' pro_t2='3' pro_t3='7' pro_t4='4'/>
		<z:row pro_numpro='1604' pro_nom='PIED DE PORC SAUMURÉ CRU' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='1603' pro_nom='BABA CREME ANGLAISE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='1602' pro_nom='ROGNONS DE MOUTON CRUS (F)' pro_critere='B15' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='3'/>
		<z:row pro_numpro='1601' pro_nom='STEAK HACHÉ D&#x27;AGNEAU CRU' pro_critere='B1' pro_t1='0' pro_t2='1' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='1600' pro_nom='PERSIL SURGELÉ' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2' pro_t4='4'/>
		<z:row pro_numpro='1596' pro_nom='FARCE A TOMATE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='1595' pro_nom='ABVT1 PAVÉ D&#x27;ESPADON' pro_critere='V15' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='1594' pro_nom='FOIE D&#x27;AGNEAU CRU (F)' pro_critere='B15' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='1593' pro_nom='TARTE A L&#x27;OIGNON AU FROMAGE CUITE' pro_critere='Z5' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='8'/>
		<z:row pro_numpro='1591' pro_nom='FILET DE JULIENNE SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='1586' pro_nom='FILET DE MAQUEREAU SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='1585' pro_nom='SALADE CUIDITÉS CRUDITÉS ET MAGRET FUMÉ' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='17'/>
		<z:row pro_numpro='1582' pro_nom='CHOU CREME PATISSIERE ET FROMAGE BLANC' pro_critere='P3' pro_t1='0' pro_t2='10'
			 pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='1581' pro_nom='CERVELLE D&#x27;AGNEAU CRUE (F)' pro_critere='B15' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='3'/>
		<z:row pro_numpro='1579' pro_nom='BROCHETTE DE POISSON DÉCONGELÉE' pro_critere='H2' pro_t1='0' pro_t2='3'
			 pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='1577' pro_nom='HAMPE DE BOEUF CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='1574' pro_nom='LANGUE DE VEAU CRUE (F)' pro_critere='B15' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='1569' pro_nom='OREILLE DE PORC CUITE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='1568' pro_nom='CREME AU CAFÉ' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='1567' pro_nom='ROTI DE CHEVAL CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='5'/>
		<z:row pro_numpro='1566' pro_nom='VIANDE DE CHEVAL CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='1565' pro_nom='VIANDE DE CHEVAL CRUE CARCASSE P' pro_critere='D1' pro_t1='0' pro_t2='1' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='1563' pro_nom='SAUCE BÉARNAISE PASTEURISÉE' pro_critere='M1' pro_t1='0' pro_t2='12' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='1562' pro_nom='BLÉ ET CREVETTES EN SALADE' pro_critere='X22' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='9'/>
		<z:row pro_numpro='1561' pro_nom='FEUILLETÉ CRU AU JAMBON CUIT' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='1559' pro_nom='MOULINÉ DE POISSON CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='1558' pro_nom='GITE D&#x27;AGNEAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='1555' pro_nom='TABOULÉ A LA VOLAILLE' pro_critere='X22' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='9'/>
		<z:row pro_numpro='1552' pro_nom='EDAM' pro_critere='P5' pro_t1='0' pro_t2='6' pro_t3='9' pro_t4='2'/>
		<z:row pro_numpro='1542' pro_nom='CONFIT DE FOIE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='1541' pro_nom='SAUCISSE DE FOIE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='1538' pro_nom='AMANDES CUITES' pro_critere='A1' pro_t1='0' pro_t2='3' pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='1537' pro_nom='POELÉE GRAND-MERE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='1536' pro_nom='BLANQUETTE DE LA MER CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='3'/>
		<z:row pro_numpro='1534' pro_nom='POELÉE CAMPAGNARDE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='1533' pro_nom='PERLINES PARISIENNES CUISINÉES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='3'/>
		<z:row pro_numpro='1527' pro_nom='COEUR DE BOEUF CRU (F)' pro_critere='B15' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='1526' pro_nom='GRAS DE VEAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='1518' pro_nom='FILET DE HARENG FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='1516' pro_nom='GATEAU DE FOIE CUIT ET FROID' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='9'
			 pro_t4='4'/>
		<z:row pro_numpro='1515' pro_nom='MOUSSE DE ROQUEFORT' pro_critere='P8' pro_t1='0' pro_t2='6' pro_t3='11' pro_t4='1'/>
		<z:row pro_numpro='1513' pro_nom='PRÉPARATION DE LÉGUMES CRUS' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='8'/>
		<z:row pro_numpro='1511' pro_nom='MAYONNAISE PASTEURISÉE' pro_critere='M1' pro_t1='0' pro_t2='8' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='1508' pro_nom='SODAS LIMONADE' pro_critere='ZL1' pro_t1='0' pro_t2='11' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='1496' pro_nom='FRICADELLE CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='1493' pro_nom='POITRINE DE VEAU FARCIE CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='1485' pro_nom='MORBIER AU LAIT PASTEURISÉ' pro_critere='P5' pro_t1='0' pro_t2='6' pro_t3='9'
			 pro_t4='2'/>
		<z:row pro_numpro='1479' pro_nom='GALETTE DE POMME DE TERRE PRÉCUITE' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='1478' pro_nom='FILET DE LIMANDE SOLE FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='1475' pro_nom='JOUE DE CABILLAUD FRAICHE' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='1473' pro_nom='SABODET' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='1472' pro_nom='JAMBON A L&#x27;OS CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='1471' pro_nom='COUENNE CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='1467' pro_nom='SAUCE AU FROMAGE CUISINÉE' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='9'
			 pro_t4='7'/>
		<z:row pro_numpro='1466' pro_nom='CUISSE DE CANARD FARCIE CRUE' pro_critere='F10' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='1463' pro_nom='BOYAU DE MOUTON CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='1462' pro_nom='ÉCHINE DE PORC CUITE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='1461' pro_nom='CARRÉ DE PORC FUMÉ CRU' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='1460' pro_nom='GOUDA' pro_critere='P5' pro_t1='0' pro_t2='6' pro_t3='9' pro_t4='2'/>
		<z:row pro_numpro='1459' pro_nom='FARCE DE VOLAILLE CRUE' pro_critere='F2' pro_t1='0' pro_t2='2' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='1457' pro_nom='GALETTE DE POMMES DE TERRE CUITE AU FROMAGE A CUIRE' pro_critere='A5' pro_t1='0'
			 pro_t2='8' pro_t3='7' pro_t4='9'/>
		<z:row pro_numpro='1456' pro_nom='BROCHETTE DE DINDE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='1455' pro_nom='TOURTEAU CUIT' pro_critere='A1' pro_t1='0' pro_t2='3' pro_t3='7' pro_t4='3'/>
		<z:row pro_numpro='1454' pro_nom='CRUDITÉS ET CUIDITÉS ET FROMAGE NON ASSAISONNÉS' pro_critere='X24' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='6'/>
		<z:row pro_numpro='1450' pro_nom='JAMBON DE DINDE CUIT E (F)' pro_critere='C1' pro_t1='0' pro_t2='5' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='1449' pro_nom='POLENTA CUITE AVEC FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='3'/>
		<z:row pro_numpro='1448' pro_nom='JAMBON DE DINDE CUIT (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='1443' pro_nom='FILET DE MERLAN FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='1442' pro_nom='PATÉ DE CANARD (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='1440' pro_nom='GATEAU AU RHUM' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='1438' pro_nom='CAPA CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='1437' pro_nom='POMMES NOISETTES CUITES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='1436' pro_nom='FEUILLETÉ AU FLAN' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='1434' pro_nom='BISCUIT CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='1431' pro_nom='VIANDE HACHÉE DE POULET CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='1426' pro_nom='PIED DE MOUTON CUIT (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='14'
			 pro_t4='1'/>
		<z:row pro_numpro='1422' pro_nom='SÉCHON AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='1417' pro_nom='CRIQUE AU JAMBON CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='9'/>
		<z:row pro_numpro='1416' pro_nom='BUCHETTE A LA GANACHE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='1415' pro_nom='SAINT PAULIN AU LAIT PASTEURISÉ' pro_critere='P5' pro_t1='0' pro_t2='6' pro_t3='9'
			 pro_t4='2'/>
		<z:row pro_numpro='1414' pro_nom='CUIDITÉS ET FROMAGE NON ASSAISONNÉS' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='17'/>
		<z:row pro_numpro='1413' pro_nom='TOMME AU LAIT PASTEURISÉ' pro_critere='P5' pro_t1='0' pro_t2='6' pro_t3='9'
			 pro_t4='2'/>
		<z:row pro_numpro='1412' pro_nom='FOIE DE VOLAILLE SAUMURÉ CRU' pro_critere='F11' pro_t1='0' pro_t2='5' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='1411' pro_nom='BISCUIT CREME MOUSSELINE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='1410' pro_nom='MOUSSE DE POISSON FUMÉ' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='19'
			 pro_t4='1'/>
		<z:row pro_numpro='1409' pro_nom='ÉMINCÉ DE VOLAILLE CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='1403' pro_nom='RISSOLE A LA VIANDE CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='4'/>
		<z:row pro_numpro='1400' pro_nom='CARRÉ DE PORC CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='1399' pro_nom='TARTE CRUE AU SAUMON CUIT' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='6'
			 pro_t4='5'/>
		<z:row pro_numpro='1397' pro_nom='DESSUS DE PALETTE DE BOEUF CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='1396' pro_nom='TÉTINE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='1395' pro_nom='SAUTÉ DE CHEVREUIL CRU' pro_critere='B2' pro_t1='0' pro_t2='2' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='1394' pro_nom='FRITONS DE CANARD (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='14'
			 pro_t4='1'/>
		<z:row pro_numpro='1393' pro_nom='STEAK DE FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='11'
			 pro_t4='1'/>
		<z:row pro_numpro='1392' pro_nom='BOUDIN DE POISSON CRU' pro_critere='J2' pro_t1='0' pro_t2='3' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='1391' pro_nom='ÉCHALOTTE CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='1390' pro_nom='CARRÉ DE PORC SAUMURÉ CUIT (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='1388' pro_nom='PANSE DE BOEUF CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='1387' pro_nom='POMMES DE TERRE ET VIANDE NON ASSAISONNÉES' pro_critere='X22' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='11'/>
		<z:row pro_numpro='1386' pro_nom='POUMON DE VEAU CRU (F)' pro_critere='B15' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='1385' pro_nom='PRÉPARATION A BASE DE VIANDE CUITE (F)' pro_critere='A1' pro_t1='0' pro_t2='5'
			 pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='1384' pro_nom='LÉGUMES AU FROMAGE CUISINÉS' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='2'/>
		<z:row pro_numpro='1383' pro_nom='PLAT DE COTES DE PORC CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='1382' pro_nom='VOLAILLE FARCIE CRUE' pro_critere='F10' pro_t1='0' pro_t2='5' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='1381' pro_nom='FLAMMENKUECHE GRATINÉE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='1380' pro_nom='GÉSIERS DE CANARD CONFITS (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='9'
			 pro_t4='1'/>
		<z:row pro_numpro='1379' pro_nom='PERSIL HACHÉ 4G (F)' pro_critere='X2' pro_t1='0' pro_t2='4' pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='1378' pro_nom='ÉPAULE CUITE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='1377' pro_nom='QUEUE DE PORC SAUMURÉE CRUE' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='1375' pro_nom='JAMBON CUIT (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='1372' pro_nom='LORRAIN CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='1370' pro_nom='ESCALOPE DE PORC PANÉE PRÉCUITE' pro_critere='B2' pro_t1='0' pro_t2='9'
			 pro_t3='1' pro_t4='4'/>
		<z:row pro_numpro='1369' pro_nom='FLAMMENKUECHE CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='8'/>
		<z:row pro_numpro='1368' pro_nom='FROMAGE A PATE MOLLE DE VACHE AU LAIT CRU (D) DEC.' pro_critere='P4' pro_t1='0'
			 pro_t2='6' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='1367' pro_nom='QUICHE SAUMON' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='8'/>
		<z:row pro_numpro='1366' pro_nom='CROUTONS' pro_critere='A1' pro_t1='0' pro_t2='12' pro_t3='3' pro_t4='4'/>
		<z:row pro_numpro='1365' pro_nom='CANARD LAQUE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='1364' pro_nom='PAVÉ DE DAGUET CRU' pro_critere='B2' pro_t1='0' pro_t2='2' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='1363' pro_nom='CRIQUE AU FROMAGE CUITE' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='9'/>
		<z:row pro_numpro='1362' pro_nom='CAKE AUX LARDONS ET FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='9'/>
		<z:row pro_numpro='1361' pro_nom='TARTELETTE AU CHOCOLAT' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='1360' pro_nom='CANELOU' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='1359' pro_nom='GATEAU A LA CREME D&#x27;AMANDE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='1357' pro_nom='ROGNONS DE VEAU CRUS (F)' pro_critere='B15' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='1356' pro_nom='AILE DE POULET CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='1355' pro_nom='COQUILLE DE SAUMON MAYONNAISE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='14'/>
		<z:row pro_numpro='1354' pro_nom='PALETTE A LA DIABLE CUISINÉE SOUS VIDE' pro_critere='A5' pro_t1='0' pro_t2='9'
			 pro_t3='6' pro_t4='3'/>
		<z:row pro_numpro='1353' pro_nom='LASAGNES BOLOGNAISE AVEC FROMAGE CUISINÉES' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='1352' pro_nom='FEUILLETÉ DE CUISSE DE GRENOUILLE CUIT' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='9'/>
		<z:row pro_numpro='1351' pro_nom='ANDOUILLE DE CHEVAL (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='15'
			 pro_t4='1'/>
		<z:row pro_numpro='1350' pro_nom='PAIN PRÉCUIT' pro_critere='A6' pro_t1='0' pro_t2='8' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='1348' pro_nom='CAILLE FARCIE CRUE' pro_critere='F10' pro_t1='0' pro_t2='2' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='1346' pro_nom='GARDIANE DE TAUREAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='1339' pro_nom='ROTI DE PORC SAUMURÉ CUIT AVEC FROMAGE (D)' pro_critere='A5' pro_t1='0' pro_t2='5'
			 pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='1333' pro_nom='FILET DE BAR FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='1331' pro_nom='FOURME D&#x27;AMBERT AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='1330' pro_nom='STEAK DE CANARD CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='1328' pro_nom='STEAK DE BISON CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='6'/>
		<z:row pro_numpro='1317' pro_nom='TRANCHE DE TAUREAU CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='6'/>
		<z:row pro_numpro='1315' pro_nom='FILET DE POULET TRAITÉ EN SALAISON CUIT (D)' pro_critere='A5' pro_t1='0'
			 pro_t2='5' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='1314' pro_nom='GRATIN DAUPHINOIS CUIT AVEC FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='9'
			 pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='1312' pro_nom='PARMENTIER DE POISSON CUISINÉ AVEC FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='9'
			 pro_t3='5' pro_t4='3'/>
		<z:row pro_numpro='1311' pro_nom='DÉCOUPE DE LIEVRE CRUE' pro_critere='B2' pro_t1='0' pro_t2='2' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='1308' pro_nom='MARRONS CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='2'/>
		<z:row pro_numpro='1306' pro_nom='CUISSE DE CANETTE FARCIE CRUE' pro_critere='F10' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='1305' pro_nom='CAROTTES CUITES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='1303' pro_nom='SAUTE DE SANGLIER CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='1302' pro_nom='PÉTONCLES FARCIES CUISINÉES' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='3'/>
		<z:row pro_numpro='1301' pro_nom='TIMBALE DE HOMARD CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='3'/>
		<z:row pro_numpro='1299' pro_nom='TRANCHE DE BISON CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='6'/>
		<z:row pro_numpro='1298' pro_nom='BUCHE A LA MOUSSE AU CHOCOLAT' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='1297' pro_nom='TERRINE DE HOMARD' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='19' pro_t4='1'/>
		<z:row pro_numpro='1296' pro_nom='BUCHE CREME MOUSSELINE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='1295' pro_nom='DÉCOUPE D&#x27;ANTILOPE CRUE' pro_critere='B2' pro_t1='0' pro_t2='2' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='1294' pro_nom='FEUILLETÉ AU FOIE GRAS CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='9'/>
		<z:row pro_numpro='1293' pro_nom='ROTI DE CERF CRU' pro_critere='B2' pro_t1='0' pro_t2='2' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='1288' pro_nom='PORCELET FARCI CUIT FROID' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='9'
			 pro_t4='2'/>
		<z:row pro_numpro='1283' pro_nom='CHAIR A SAUCISSE DE VOLAILLE CRUE' pro_critere='F4' pro_t1='0' pro_t2='5'
			 pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='1282' pro_nom='SANDWICH AU CRABE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='3' pro_t4='4'/>
		<z:row pro_numpro='1279' pro_nom='PAUPIETTE DE GIBIER PRÉCUITE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='1278' pro_nom='HOMARD ENTIER CUIT' pro_critere='A1' pro_t1='0' pro_t2='3' pro_t3='7' pro_t4='3'/>
		<z:row pro_numpro='1277' pro_nom='FEUILLETÉ AUX CRUSTACÉS CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='9'/>
		<z:row pro_numpro='1273' pro_nom='GRATIN DE MOULES AU FROMAGE CUISINÉ' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='1272' pro_nom='POMMES DE TERRE ET POISSON NON ASSAISONNES' pro_critere='X22' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='13'/>
		<z:row pro_numpro='1269' pro_nom='SANDWICH AU SAUMON CRU MARINÉ' pro_critere='J1' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='4'/>
		<z:row pro_numpro='1265' pro_nom='CRUDITÉS ET FRUITS DE MER CUITS EN SALADE' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='14'/>
		<z:row pro_numpro='1261' pro_nom='BOUILLON DÉSHYDRATÉ' pro_critere='A1' pro_t1='0' pro_t2='12' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='1260' pro_nom='FUMET DÉSHYDRATÉ' pro_critere='A1' pro_t1='0' pro_t2='12' pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='1259' pro_nom='DÉCOUPE DE COQ CRUE' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='1258' pro_nom='BRIOCHE CREME FOUETTÉE S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='1256' pro_nom='CUISSE DE POULET PRÉCUITE' pro_critere='F1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='3'/>
		<z:row pro_numpro='1253' pro_nom='SAUCE CARAMEL' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='1251' pro_nom='PATÉ CROUTE COCKTAIL (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='13'
			 pro_t4='1'/>
		<z:row pro_numpro='1248' pro_nom='CREVETTES ROSES CUITES EN SALADE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='14'/>
		<z:row pro_numpro='1247' pro_nom='STOCKFISCH CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='1245' pro_nom='STEAK HACHÉ DE TRUITE TRANCHÉ (D) RECONDITIONNÉ' pro_critere='J2' pro_t1='0'
			 pro_t2='3' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='1244' pro_nom='CERVELAS A CUIRE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='1241' pro_nom='CIVET DE FILET D&#x27;OIE CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='1240' pro_nom='SAUCISSE BLANCHE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='1238' pro_nom='ABVT1 LOTTE' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='1237' pro_nom='ABVT1 FILET DE SANDRE' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='1236' pro_nom='FRUITS A LA CRÉME D&#x27;AMANDE' pro_critere='A1' pro_t1='0' pro_t2='10'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='1235' pro_nom='SAUCE BÉCHAMEL AVEC FROMAGE CRU' pro_critere='A5' pro_t1='0' pro_t2='9' pro_t3='9'
			 pro_t4='2'/>
		<z:row pro_numpro='1232' pro_nom='CORDON BLEU DE PORC CRU TRAITE EN SALAISON' pro_critere='F10' pro_t1='0' pro_t2='1'
			 pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='1231' pro_nom='SAUCE AURORE &#x22;MAISON&#x22;' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='1227' pro_nom='ABVT1 SABRE' pro_critere='V13' pro_t1='0' pro_t2='3' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='1223' pro_nom='CALAMAR CRU' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='1221' pro_nom='ÉCHINE DE PORC FUMÉE CRUE' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='1215' pro_nom='OEUF MOULÉ' pro_critere='A1' pro_t1='0' pro_t2='7' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='1209' pro_nom='CANNELÉ' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='1208' pro_nom='KASSLER (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='1207' pro_nom='GRATIN DE LÉGUMES CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='2'/>
		<z:row pro_numpro='1203' pro_nom='GALETTE DE BLÉ FARCI AU POULET PRÉCUIT' pro_critere='A5' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='4'/>
		<z:row pro_numpro='1201' pro_nom='MOUSSE AU CRABE' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='19' pro_t4='1'/>
		<z:row pro_numpro='1199' pro_nom='MOUSSE DE POISSON EN SEMI CONSERVE' pro_critere='M1' pro_t1='0' pro_t2='5'
			 pro_t3='19' pro_t4='1'/>
		<z:row pro_numpro='1198' pro_nom='CASSOLETTE DE POISSON CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='3'/>
		<z:row pro_numpro='1195' pro_nom='PAVÉ DE BOEUF PRÉCUIT' pro_critere='B2' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='4'/>
		<z:row pro_numpro='1194' pro_nom='TRAVERS DE PORC PRÉCUIT' pro_critere='B2' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='4'/>
		<z:row pro_numpro='1182' pro_nom='FILET DE GRONDIN FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='1178' pro_nom='TAPIOCA AU LAIT' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='1177' pro_nom='ASPIC MOUSSE AU JAMBON CUIT' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='1176' pro_nom='SALERS AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='1173' pro_nom='APPLE CRUMBLE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='1171' pro_nom='TRAVERS DE PORC SAUMURÉ CRU' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='1168' pro_nom='POULPE CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='1167' pro_nom='TERRINE DE BISON (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='1166' pro_nom='FROMAGE A PATE MOLLE AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='1156' pro_nom='BEURRE CONCENTRÉ' pro_critere='Q4' pro_t1='0' pro_t2='6' pro_t3='2' pro_t4='2'/>
		<z:row pro_numpro='1153' pro_nom='PELARDON AU LAIT CRU' pro_critere='P4' pro_t1='0' pro_t2='6' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='1152' pro_nom='DARNE DE MEROU FRAICHE' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='1151' pro_nom='PILON DE POULET CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='1150' pro_nom='AIL SEMOULE' pro_critere='U3' pro_t1='0' pro_t2='4' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='1149' pro_nom='CREPES CUITES AUX HERBES' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='1148' pro_nom='ABVT1 FILET DE TURBO' pro_critere='V11' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='1147' pro_nom='TARTE A LA CREME AU BEURRE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='1146' pro_nom='SOUPE A L&#x27;OIGNON' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='1144' pro_nom='ASPERGES SURGELÉES' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='1142' pro_nom='CHAIR A PATÉ CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='1141' pro_nom='GATEAU DE CÉRÉALES' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='1140' pro_nom='MÉDAILLON DE SAUMON FARCI FRAIS' pro_critere='J2' pro_t1='0' pro_t2='3' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='1139' pro_nom='OEUF DE POISSON FUMÉ' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='1138' pro_nom='PATE DE TETE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='14' pro_t4='1'/>
		<z:row pro_numpro='1136' pro_nom='HOT DOG AU FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='4'/>
		<z:row pro_numpro='1135' pro_nom='POULET TRAITÉ EN SALAISON CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='1134' pro_nom='PRÉPARATION HACHÉE DE POULET CRUE TRAITÉE EN SALAISON' pro_critere='F2'
			 pro_t1='0' pro_t2='2' pro_t3='7' pro_t4='2'/>
		<z:row pro_numpro='1132' pro_nom='MAQUEREAU FUMÉ' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='1131' pro_nom='GRATIN DE CROZETS AU FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='8' pro_t4='3'/>
		<z:row pro_numpro='1126' pro_nom='BOYAU DE BOEUF CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='1124' pro_nom='COOKIE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='1114' pro_nom='FILET DE TILAPIA FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='1111' pro_nom='CUISSE DE PINTADE FARCIE CUITE' pro_critere='A2' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='3'/>
		<z:row pro_numpro='1110' pro_nom='PATÉ DE BISON (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10' pro_t4='2'/>
		<z:row pro_numpro='1107' pro_nom='TETE DE PORC CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='1106' pro_nom='ROTI DE POULET SAUMURÉ CUIT (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='1103' pro_nom='SALADE CUIDITÉS CRUDITÉS ET POISSON MARINÉ' pro_critere='X24' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='13'/>
		<z:row pro_numpro='1100' pro_nom='TERRINE DE POT AU FEU (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='22'
			 pro_t4='1'/>
		<z:row pro_numpro='1098' pro_nom='MANCHON DE POULET CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='1096' pro_nom='FEUILLETÉ A LA SAUCISSE CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='1091' pro_nom='SANDWICH ROSETTE' pro_critere='G1' pro_t1='0' pro_t2='8' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='1090' pro_nom='CONFIT DE MANCHON DE CANARD (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='9'
			 pro_t4='1'/>
		<z:row pro_numpro='1085' pro_nom='PARMENTIER DE VIANDE CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='1079' pro_nom='BROWNIE CRU' pro_critere='A6' pro_t1='0' pro_t2='10' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='1078' pro_nom='CUIDITÉS ET THON NON ASSAISONNÉS' pro_critere='X24' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='14'/>
		<z:row pro_numpro='1077' pro_nom='ÉPINARDS CRUS ASSAISONNÉS' pro_critere='X6' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='1076' pro_nom='CREME FRANGIPANE A CUIRE' pro_critere='A6' pro_t1='0' pro_t2='10' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='1074' pro_nom='COQUILLE SURIMI MACÉDOINE' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='13'/>
		<z:row pro_numpro='1073' pro_nom='GÉNOISE A LA CONFITURE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='1072' pro_nom='STEAK HACHÉ DE VOLAILLE CRU' pro_critere='F2' pro_t1='0' pro_t2='2' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='1069' pro_nom='FEUILLETÉ CRU A LA SAUCISSE CRUE' pro_critere='F4' pro_t1='0' pro_t2='8'
			 pro_t3='6' pro_t4='9'/>
		<z:row pro_numpro='1065' pro_nom='FOIE GRAS DE CANARD CRU' pro_critere='G2' pro_t1='0' pro_t2='2' pro_t3='6'
			 pro_t4='1'/>
		<z:row pro_numpro='1063' pro_nom='LANGOUSTINES CUITES' pro_critere='A1' pro_t1='0' pro_t2='3' pro_t3='7' pro_t4='3'/>
		<z:row pro_numpro='1062' pro_nom='SANDWICH CHORIZO ET POULET' pro_critere='G1' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='7'/>
		<z:row pro_numpro='1059' pro_nom='ÉPINARDS CRUS A LA CREME' pro_critere='X6' pro_t1='0' pro_t2='4' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='1055' pro_nom='SPAGHETTIS BOLOGNAISE CUISINÉS AVEC FROMAGE' pro_critere='A5' pro_t1='0'
			 pro_t2='9' pro_t3='8' pro_t4='3'/>
		<z:row pro_numpro='1041' pro_nom='MIMOLETTE' pro_critere='P5' pro_t1='0' pro_t2='6' pro_t3='9' pro_t4='2'/>
		<z:row pro_numpro='1037' pro_nom='FRICADELLE PRÉCUITE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='1035' pro_nom='RAVIOLIS FRAIS AU FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='1027' pro_nom='BANANES FLAMBÉES' pro_critere='X4' pro_t1='0' pro_t2='10' pro_t3='8' pro_t4='3'/>
		<z:row pro_numpro='1026' pro_nom='CIVET DE BOEUF CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='5'/>
		<z:row pro_numpro='1016' pro_nom='FEUILLETÉ SUCRÉ CUIT' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='1014' pro_nom='FLAN DE SAUMONETTE FUMÉ' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='1011' pro_nom='DÉCOUPE DE KANGOUROU CRUE' pro_critere='B2' pro_t1='0' pro_t2='2' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='1010' pro_nom='FILET DE SANDRE SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='1006' pro_nom='VIANDE HACHÉE DE PORC AU FROMAGE CUITE' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='6319' pro_nom='FROMAGE FRAIS DE VACHE AU LAIT PASTEURISÉ' pro_critere='O3' pro_t1='0' pro_t2='6'
			 pro_t3='6' pro_t4='2'/>
		<z:row pro_numpro='6317' pro_nom='JARRET D&#x27;AGNEAU CUISINÉ' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='6316' pro_nom='ABVT1 FILET DE MORUE' pro_critere='V12' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='6315' pro_nom='BISCUIT CREME AU BEURRE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='6314' pro_nom='JAMBON FUMÉ CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='6313' pro_nom='ENCORNET CRU' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='6311' pro_nom='CROTTIN DE SAUMON' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='19' pro_t4='1'/>
		<z:row pro_numpro='6310' pro_nom='DÉCOUPE DE CHEVREUIL CRUE' pro_critere='B2' pro_t1='0' pro_t2='2' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='6309' pro_nom='PIEDS DE VEAU EN SALADE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='11'/>
		<z:row pro_numpro='6308' pro_nom='CRÉPINE DE PORC CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='6307' pro_nom='FILET DE LOTTE SURGELÉ' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='6306' pro_nom='MÉDAILLON DE VOLAILLE EN GELÉE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='6304' pro_nom='BANANE SAUCE CHOCOLAT' pro_critere='X6' pro_t1='0' pro_t2='10' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='6303' pro_nom='CUIDITÉS ET CRUDITÉS NON ASSAISONNÉS' pro_critere='X4' pro_t1='0' pro_t2='8'
			 pro_t3='1' pro_t4='3'/>
		<z:row pro_numpro='6299' pro_nom='COEUR DE RUMSTECK DE BOEUF CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='6298' pro_nom='GIGOLETTE DE LAPIN CRUE' pro_critere='B2' pro_t1='0' pro_t2='2' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='6297' pro_nom='FILET DE THON FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='6296' pro_nom='ABVT2 BROCHETTE DE LIEU NOIR' pro_critere='V12' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='6295' pro_nom='BROCHETTE DE FRUITS DE MER CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='6294' pro_nom='CUIDITÉS CRUDITÉS ET FROMAGE NON ASSAISONNÉS' pro_critere='X24' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='17'/>
		<z:row pro_numpro='6293' pro_nom='NOISETTE D&#x27;AGNEAU CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='6289' pro_nom='VIANDE DE CHEVREUIL CRUE' pro_critere='B2' pro_t1='0' pro_t2='2' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='6288' pro_nom='BABA CREME FOUETTÉE S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='6287' pro_nom='T.BONE DE BOEUF CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='6286' pro_nom='ASPIC AU SURIMI' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='6285' pro_nom='CHAIR A MERGUEZ CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='6284' pro_nom='FILET DE POULET CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='6283' pro_nom='POMMES DE TERRE FARCIES CRUES' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='6281' pro_nom='APPAREIL A QUICHE' pro_critere='A5' pro_t1='0' pro_t2='7' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='6280' pro_nom='FEUILLETÉ CRU AUX FRUITS DE MER' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='6'
			 pro_t4='3'/>
		<z:row pro_numpro='6279' pro_nom='SAUMON FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='6278' pro_nom='SALADE CUIDITÉS CRUDITÉS ET SAUCISSON SEC' pro_critere='X28' pro_t1='0'
			 pro_t2='8' pro_t3='1' pro_t4='5'/>
		<z:row pro_numpro='6277' pro_nom='CAROTTES RAPÉES NON ASSAISONNÉES' pro_critere='X3' pro_t1='0' pro_t2='4'
			 pro_t3='1' pro_t4='2'/>
		<z:row pro_numpro='6276' pro_nom='FOND DE SAUCE DÉSHYDRATÉ' pro_critere='A1' pro_t1='0' pro_t2='12' pro_t3='1'
			 pro_t4='2'/>
		<z:row pro_numpro='6275' pro_nom='SEICHE SURGELÉE' pro_critere='H2' pro_t1='0' pro_t2='3' pro_t3='6' pro_t4='1'/>
		<z:row pro_numpro='6274' pro_nom='PIPPERONI' pro_critere='G1' pro_t1='0' pro_t2='5' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='6273' pro_nom='PAIN AUX RAISINS CRU' pro_critere='A6' pro_t1='0' pro_t2='8' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='6272' pro_nom='GARBURE CUISINÉE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='6' pro_t4='2'/>
		<z:row pro_numpro='6271' pro_nom='APPAREIL AU CITRON' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='6269' pro_nom='CREME D&#x27;ANCHOIS' pro_critere='M6' pro_t1='0' pro_t2='3' pro_t3='12' pro_t4='1'/>
		<z:row pro_numpro='6268' pro_nom='MAGRET DE CANARD CONFIT (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='9'
			 pro_t4='1'/>
		<z:row pro_numpro='6267' pro_nom='GRUYERE AU LAIT PASTEURISÉ' pro_critere='P5' pro_t1='0' pro_t2='6' pro_t3='10'
			 pro_t4='2'/>
		<z:row pro_numpro='6266' pro_nom='SAINT MARCELLIN AU LAIT PASTEURISÉ' pro_critere='O7' pro_t1='0' pro_t2='6'
			 pro_t3='7' pro_t4='2'/>
		<z:row pro_numpro='6265' pro_nom='ABVT2 ROTI DE LIEU NOIR' pro_critere='V12' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='6264' pro_nom='ABVT3 JOUE DE RAIE' pro_critere='V15' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='3'/>
		<z:row pro_numpro='6263' pro_nom='VIANDE DE DINDE CRUE' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='6262' pro_nom='OSSO BUCCO DE VOLAILLE CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='6261' pro_nom='MANCHON DE CANARD CRU' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='6260' pro_nom='BLANQUETTE DE DINDONNEAU CRUE' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='6259' pro_nom='FILET DE CONGRE FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='6258' pro_nom='FILET DE COLIN FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='6256' pro_nom='FILET DE BERIX FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='6255' pro_nom='FILET D&#x27;ÉGLEFIN FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='6254' pro_nom='CORDON BLEU HACHÉ DE PORC CRU' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='6253' pro_nom='TERRINE DE GIBIER (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='6252' pro_nom='JAMBONNEAU CUIT PANÉ (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='6251' pro_nom='SAUCISSON CUIT DE CHEVAL (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='6250' pro_nom='COTE DE CERF CRUE' pro_critere='B2' pro_t1='0' pro_t2='2' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='6249' pro_nom='CONFIT DE VIANDE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='6248' pro_nom='GÉNOISE CREME FOUETTÉE (D)' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='6247' pro_nom='VIANDE TRAITÉE EN SALAISON CUITE EN GELÉE (D)' pro_critere='A5' pro_t1='0'
			 pro_t2='5' pro_t3='22' pro_t4='1'/>
		<z:row pro_numpro='6246' pro_nom='BOEUF TRAITÉ EN SALAISON CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5'
			 pro_t3='22' pro_t4='1'/>
		<z:row pro_numpro='6245' pro_nom='ESCALOPE DE VOLAILLE AVEC FROMAGE PRÉCUITE' pro_critere='F10' pro_t1='0'
			 pro_t2='9' pro_t3='3' pro_t4='5'/>
		<z:row pro_numpro='6243' pro_nom='BRIOCHE A LA VIANDE CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='4'/>
		<z:row pro_numpro='6242' pro_nom='CORNET CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='6241' pro_nom='MÉDAILLON DE THON EN GELÉE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='6240' pro_nom='FRITONS (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='9' pro_t4='1'/>
		<z:row pro_numpro='6237' pro_nom='PRÉPARATION HACHÉE CRUE TRAITÉE EN SALAISON' pro_critere='F4' pro_t1='0'
			 pro_t2='5' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='6235' pro_nom='CRUDITÉS NON ASSAISONNÉES' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='6234' pro_nom='FILET DE DINDE TRAITÉ SALAISON CUIT (D)' pro_critere='A5' pro_t1='0' pro_t2='5'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='6233' pro_nom='VIANDE HACHÉE DE LAPIN CUITE' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='4'/>
		<z:row pro_numpro='6232' pro_nom='CUISSE DE LIEVRE CRUE' pro_critere='B2' pro_t1='0' pro_t2='2' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='6231' pro_nom='PATÉ AUX OLIVES (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='6230' pro_nom='TARTARE DE SAUMON FUMÉ' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='6228' pro_nom='POISSON CUISINÉ AVEC FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='9' pro_t3='5'
			 pro_t4='3'/>
		<z:row pro_numpro='6227' pro_nom='TARTE CREME CHANTILLY (D)' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='6226' pro_nom='RAVIOLIS CUISINÉS AVEC FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='9' pro_t3='8'
			 pro_t4='7'/>
		<z:row pro_numpro='6225' pro_nom='FROMAGE BLANC PASTEURISÉ (D)' pro_critere='O3' pro_t1='0' pro_t2='6' pro_t3='6'
			 pro_t4='2'/>
		<z:row pro_numpro='6223' pro_nom='TOMATE FARCIE CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='6222' pro_nom='TIMBALE DE FRUITS DE MER CUITE FROIDE' pro_critere='A1' pro_t1='0' pro_t2='8'
			 pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='6221' pro_nom='TARTELETTE CREME AU BEURRE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='6220' pro_nom='GERMES DE SOJA' pro_critere='X5' pro_t1='0' pro_t2='4' pro_t3='1' pro_t4='5'/>
		<z:row pro_numpro='6219' pro_nom='SAUCISSE DE LANGUE (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='14'
			 pro_t4='1'/>
		<z:row pro_numpro='6218' pro_nom='POMMES DE TERRE FRITES PRÉCUITES' pro_critere='A1' pro_t1='0' pro_t2='4'
			 pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='6217' pro_nom='PIGEON ENTIER CRU' pro_critere='F5' pro_t1='0' pro_t2='2' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='6216' pro_nom='MOULES DÉCOQUILLÉES' pro_critere='J3' pro_t1='0' pro_t2='3' pro_t3='5' pro_t4='3'/>
		<z:row pro_numpro='6215' pro_nom='MIROIR AUX FRUITS' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='6214' pro_nom='FRUITS CONFITS' pro_critere='A1' pro_t1='0' pro_t2='12' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='6213' pro_nom='FILET DE CANARD FUMÉ CRU' pro_critere='F7' pro_t1='0' pro_t2='5' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='6212' pro_nom='CREVETTES ROSES CUITES DÉCORTIQUÉES' pro_critere='J1' pro_t1='0' pro_t2='3'
			 pro_t3='7' pro_t4='4'/>
		<z:row pro_numpro='6211' pro_nom='CREVETTES ENTIERES CUITES' pro_critere='A1' pro_t1='0' pro_t2='3' pro_t3='7'
			 pro_t4='3'/>
		<z:row pro_numpro='6210' pro_nom='COURGETTE FARCIE CRUE' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='6209' pro_nom='COLLIER DE MOUTON CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='4'/>
		<z:row pro_numpro='6208' pro_nom='ANGUILLE FUMÉE' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='6207' pro_nom='VIANDE DE SANGLIER CRUE' pro_critere='B2' pro_t1='0' pro_t2='2' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='6206' pro_nom='VIANDE SÉPARÉE MÉCANIQUEMENT CUITE' pro_critere='A1' pro_t1='0' pro_t2='9'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='6205' pro_nom='VIANDE DE BOVIN CRUE SÉPARÉE MÉCANIQUEMENT' pro_critere='B5' pro_t1='0'
			 pro_t2='1' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='6204' pro_nom='TERRINE DE SANGLIER (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='10'
			 pro_t4='1'/>
		<z:row pro_numpro='6203' pro_nom='TERRINE DE CRABE' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='19' pro_t4='1'/>
		<z:row pro_numpro='6202' pro_nom='STEAK HACHÉ DE POISSON FRAIS' pro_critere='J2' pro_t1='0' pro_t2='3' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='6201' pro_nom='SPRAT FUMÉ' pro_critere='M3' pro_t1='0' pro_t2='3' pro_t3='8' pro_t4='1'/>
		<z:row pro_numpro='6200' pro_nom='SOUBRESSADE' pro_critere='G1' pro_t1='0' pro_t2='5' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='6199' pro_nom='ROULÉ DE SAUMON' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='19' pro_t4='1'/>
		<z:row pro_numpro='6198' pro_nom='RIS DE VEAU CRU (D)' pro_critere='B16' pro_t1='0' pro_t2='1' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='6197' pro_nom='POITRINE DE PORC FARCIE CUITE (D)' pro_critere='A5' pro_t1='0' pro_t2='5'
			 pro_t3='12' pro_t4='1'/>
		<z:row pro_numpro='6196' pro_nom='PIED DE PORC CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='6195' pro_nom='PATÉ IMPÉRIAL CUIT' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7' pro_t4='6'/>
		<z:row pro_numpro='6194' pro_nom='PATÉ DE JAMBON (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='10' pro_t4='1'/>
		<z:row pro_numpro='6191' pro_nom='LÉGUMES FARCIS CRUS' pro_critere='F4' pro_t1='0' pro_t2='5' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='6190' pro_nom='LANGUE DE PORC EN GELÉE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='14'
			 pro_t4='1'/>
		<z:row pro_numpro='6189' pro_nom='JARRET D&#x27;AGNEAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='6188' pro_nom='HURE DE PORC (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='14' pro_t4='1'/>
		<z:row pro_numpro='6187' pro_nom='GALANTINE DE PORC (D)' pro_critere='A5' pro_t1='0' pro_t2='5' pro_t3='12'
			 pro_t4='1'/>
		<z:row pro_numpro='6186' pro_nom='FRIAND CRU A LA VIANDE CRUE' pro_critere='F4' pro_t1='0' pro_t2='8' pro_t3='6'
			 pro_t4='4'/>
		<z:row pro_numpro='6185' pro_nom='FOIE DE BOEUF CUIT' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='6184' pro_nom='FILET D&#x27;AGNEAU CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='6183' pro_nom='CRUDITÉS VARIÉES 4G (F)' pro_critere='X1' pro_t1='0' pro_t2='4' pro_t3='1'
			 pro_t4='6'/>
		<z:row pro_numpro='6181' pro_nom='CHICKEN NUGGET&#x27;S CUITS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='6180' pro_nom='CAROTTES CRUES EN RONDELLES' pro_critere='X3' pro_t1='0' pro_t2='4' pro_t3='1'
			 pro_t4='3'/>
		<z:row pro_numpro='6179' pro_nom='CANNELLONIS FRAIS A LA VIANDE' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='4'
			 pro_t4='2'/>
		<z:row pro_numpro='6178' pro_nom='BRIOCHE CREME PATISSIERE' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='6177' pro_nom='BLANC D&#x27;OEUF NON PASTEURISÉ' pro_critere='R1' pro_t1='0' pro_t2='7'
			 pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='6176' pro_nom='BISCUIT CREME CHANTILLY S' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='6175' pro_nom='BALLOTINE DE POISSON' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='19' pro_t4='1'/>
		<z:row pro_numpro='5001' pro_nom='ALLUMETTE CUITE AU FROMAGE A CUIRE' pro_critere='A5' pro_t1='0' pro_t2='8'
			 pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='6182' pro_nom='FROMAGE DE TETE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='14' pro_t4='1'/>
		<z:row pro_numpro='6320' pro_nom='APPAREIL SAUCE FRUIT CUIT' pro_critere='P1' pro_t1='0' pro_t2='10' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='6321' pro_nom='OEUFS ENTIERS PASTEURISÉS' pro_critere='P2' pro_t1='0' pro_t2='7' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='6328' pro_nom='JAMBONNEAU CUIT (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='6332' pro_nom='PANINI THON FROMAGE, A CUIRE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='7'/>
		<z:row pro_numpro='6333' pro_nom='TARTINE TRUITE FUMÉE' pro_critere='A8' pro_t1='0' pro_t2='8' pro_t3='3' pro_t4='4'/>
		<z:row pro_numpro='6334' pro_nom='BP SAVAMBO' pro_critere='P1' pro_t1='0' pro_t2='1' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='6345' pro_nom='JAMBONNEAU DE PORC SAUMURE CUIT (F)' pro_critere='A1' pro_t1='0' pro_t2='5'
			 pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='6348' pro_nom='FARCE AVEC FROMAGE CUIT' pro_critere='Z5' pro_t1='0' pro_t2='9' pro_t3='4'
			 pro_t4='1'/>
		<z:row pro_numpro='6349' pro_nom='SANDWICH CRUDITÉS ET DENRÉE ANIMALE CUITE' pro_critere='X24' pro_t1='0'
			 pro_t2='8' pro_t3='3' pro_t4='7'/>
		<z:row pro_numpro='6350' pro_nom='PIED DE VEAU CUIT (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='14'
			 pro_t4='1'/>
		<z:row pro_numpro='6359' pro_nom='TRIPES CUITES TRAITÉES EN SALAISON (F)' pro_critere='A1' pro_t1='0' pro_t2='5'
			 pro_t3='15' pro_t4='1'/>
		<z:row pro_numpro='6368' pro_nom='SANDWICH CRUDITÉS ET DENRÉE(S) ANIMALE(S) CUITE(S)' pro_critere='X24' pro_t1='0'
			 pro_t2='8' pro_t3='3' pro_t4='7'/>
		<z:row pro_numpro='6372' pro_nom='QUICHE AUX LÉGUMES CUITE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='8'/>
		<z:row pro_numpro='6385' pro_nom='QUENELLE CUISINÉE AVEC FROMAGE RAPÉ A CUIRE' pro_critere='A5' pro_t1='0'
			 pro_t2='9' pro_t3='8' pro_t4='7'/>
		<z:row pro_numpro='6393' pro_nom='DÉCOUPE DE VIANDE DE BOUCHERIE CRUE ASSAISONNÉE' pro_critere='F10' pro_t1='0'
			 pro_t2='1' pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='6400' pro_nom='SOUPE PASTEURISÉE' pro_critere='M1' pro_t1='0' pro_t2='12' pro_t3='3' pro_t4='4'/>
		<z:row pro_numpro='6401' pro_nom='BRANDADE DE POISSON AU FROMAGE CUISINÉE' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='5' pro_t4='3'/>
		<z:row pro_numpro='6404' pro_nom='SAUCISSE CUITE EN SALADE' pro_critere='A5' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='11'/>
		<z:row pro_numpro='6408' pro_nom='CRÉPE AU FROMAGE CUITE' pro_critere='Z5' pro_t1='0' pro_t2='8' pro_t3='7'
			 pro_t4='1'/>
		<z:row pro_numpro='6411' pro_nom='PLANTE OU HERBE AROMATIQUE SURGELÉE' pro_critere='U2' pro_t1='0' pro_t2='4'
			 pro_t3='2' pro_t4='4'/>
		<z:row pro_numpro='6422' pro_nom='GAMBAS CRUE SURGELÉE' pro_critere='I1' pro_t1='0' pro_t2='3' pro_t3='7' pro_t4='6'/>
		<z:row pro_numpro='6430' pro_nom='SANDWICH CRUDITÉ(S) ET DENRÉE(S) ANIMALE(S) CRUE(S)' pro_critere='X28' pro_t1='0'
			 pro_t2='8' pro_t3='3' pro_t4='7'/>
		<z:row pro_numpro='6431' pro_nom='ANDOUILLETTE CUITE SEMI CONSERVE' pro_critere='M1' pro_t1='0' pro_t2='5' pro_t3='15'
			 pro_t4='1'/>
		<z:row pro_numpro='6432' pro_nom='FROMAGE A PATE MOLLE AU LAIT PASTEURISÉ' pro_critere='O7' pro_t1='0' pro_t2='6'
			 pro_t3='7' pro_t4='2'/>
		<z:row pro_numpro='6435' pro_nom='SANG FRAIS ET PRODUITS DE SANG MANIPULÉS' pro_critere='B4' pro_t1='0' pro_t2='1'
			 pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='6439' pro_nom='COULOMMIER AU LAIT PASTEURISÉ' pro_critere='O7' pro_t1='0' pro_t2='6' pro_t3='7'
			 pro_t4='2'/>
		<z:row pro_numpro='6451' pro_nom='ROTI DE VOLAILLE TRAITÉ EN SALAISON CUIT (F)' pro_critere='A1' pro_t1='0'
			 pro_t2='5' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='6452' pro_nom='FILET DE VOLAILLE TRAITÉ EN SALAISON CUIT (F)' pro_critere='A1' pro_t1='0'
			 pro_t2='5' pro_t3='4' pro_t4='1'/>
		<z:row pro_numpro='6453' pro_nom='GRATIN DE LÉGUME(S) CUISINÉ AVEC FROMAGE' pro_critere='A5' pro_t1='0' pro_t2='9'
			 pro_t3='5' pro_t4='2'/>
		<z:row pro_numpro='6456' pro_nom='SANDWICH CRUDITÉ(S) ET FROMAGE' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='3'
			 pro_t4='7'/>
		<z:row pro_numpro='6469' pro_nom='OEUFS CUISINÉS' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='6470' pro_nom='SANDWICH VIANDE TRAITÉE EN SALAISON, SECHÉE, FUMÉE OU NON' pro_critere='F3'
			 pro_t1='0' pro_t2='8' pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='6473' pro_nom='DÉCOUPE DE POULET CRUE' pro_critere='F1' pro_t1='0' pro_t2='2' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='6484' pro_nom='ROTI DE DINDE SAUMURE CRU' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='6498' pro_nom='GRAS DE MOUTON CRU' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='4'/>
		<z:row pro_numpro='6513' pro_nom='LEVAIN' pro_critere='A6.2' pro_t1='0' pro_t2='12' pro_t3='1' pro_t4='1'/>
		<z:row pro_numpro='6524' pro_nom='FILET DE BROTULE FRAIS' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='1'/>
		<z:row pro_numpro='6527' pro_nom='ABVT1 FILET DE BROTULE' pro_critere='V11' pro_t1='0' pro_t2='3' pro_t3='3'
			 pro_t4='2'/>
		<z:row pro_numpro='6533' pro_nom='POD BRIOCHE CHOCOLAT' pro_critere='A1.7' pro_t1='0' pro_t2='1' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='6535' pro_nom='ABVT TRANCHE DE LIEU JAUNE' pro_critere='V12' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='2'/>
		<z:row pro_numpro='6540' pro_nom='STEACK HACHÉ DE VEAU CRU AU FROMAGE' pro_critere='Z6' pro_t1='0' pro_t2='1'
			 pro_t3='3' pro_t4='2'/>
		<z:row pro_numpro='6564' pro_nom='VIANDE DE BOUCHERIE PRECUITE' pro_critere='B2' pro_t1='0' pro_t2='9' pro_t3='1'
			 pro_t4='4'/>
		<z:row pro_numpro='6565' pro_nom='PREPARATION DE VIANDE DE BOUCHERIE CRUE ASSAISONNEE' pro_critere='F10' pro_t1='0'
			 pro_t2='1' pro_t3='2' pro_t4='3'/>
		<z:row pro_numpro='6566' pro_nom='LANGUE EN GELÉE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='14' pro_t4='1'/>
		<z:row pro_numpro='6567' pro_nom='TERRINE POULET EN GELEE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='6569' pro_nom='LANGUE DE BOEUF EN GELÉE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='14'
			 pro_t4='1'/>
		<z:row pro_numpro='6579' pro_nom='TRAVERS DE PORC CRU ÉPICE' pro_critere='F10' pro_t1='0' pro_t2='1' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='6692' pro_nom='POITRINE DE PORC CRUE EPICEE' pro_critere='F10' pro_t1='0' pro_t2='1' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='6725' pro_nom='BRANDADE DE MORUE AVEC FROMAGE CUISINÉ' pro_critere='Z5' pro_t1='0' pro_t2='9'
			 pro_t3='5' pro_t4='1'/>
		<z:row pro_numpro='6751' pro_nom='CHUTNEY' pro_critere='A1' pro_t1='0' pro_t2='9' pro_t3='9' pro_t4='4'/>
		<z:row pro_numpro='6800' pro_nom='JOUE DE PORC CUITE (F)' pro_critere='A1' pro_t1='0' pro_t2='5' pro_t3='14'
			 pro_t4='1'/>
		<z:row pro_numpro='35504' pro_nom='APPAREIL PATE D&#x27;AMANDE AMANDINE' pro_critere='P1' pro_t1='0' pro_t2='10'
			 pro_t3='7' pro_t4='1'/>
		<z:row pro_numpro='35507' pro_nom='TAPENADE AVEC FROMAGE' pro_critere='X24' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='19'/>
		<z:row pro_numpro='35510' pro_nom='CHARCUTERIE CUITE EN SALADE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1'
			 pro_t4='5'/>
		<z:row pro_numpro='35515' pro_nom='PANSE D&#x27;AGNEAU CRUE' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='4'
			 pro_t4='3'/>
		<z:row pro_numpro='35516' pro_nom='SORBET NON PASTEURISE' pro_critere='X6' pro_t1='0' pro_t2='10' pro_t3='8'
			 pro_t4='1'/>
		<z:row pro_numpro='35525' pro_nom='THON VINAIGRETTE' pro_critere='A1' pro_t1='0' pro_t2='8' pro_t3='1' pro_t4='11'/>
		<z:row pro_numpro='35532' pro_nom='PAIN DE COTE SALÉ CRU' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='1'
			 pro_t4='1'/>
		<z:row pro_numpro='35544' pro_nom='POITRINE DE DINDE SAUMURÉE CUITE (F)' pro_critere='A1' pro_t1='0' pro_t2='5'
			 pro_t3='4' pro_t4='2'/>
		<z:row pro_numpro='35613' pro_nom='MINERAI DE MOUTON CRU' pro_critere='B1' pro_t1='0' pro_t2='1' pro_t3='2'
			 pro_t4='4'/>
		<z:row pro_numpro='35615' pro_nom='APP THYM SURGELÉ' pro_critere='U2' pro_t1='0' pro_t2='4' pro_t3='2' pro_t4='4'/>
		<z:row pro_numpro='35619' pro_nom='LONZO' pro_critere='F3' pro_t1='0' pro_t2='5' pro_t3='3' pro_t4='1'/>
		<z:row pro_numpro='35628' pro_nom='CARPACCIO DE BISON' pro_critere='B2' pro_t1='0' pro_t2='1' pro_t3='2' pro_t4='1'/>
		<z:row pro_numpro='35630' pro_nom='DARNE DE REQUIN FRAICHE' pro_critere='J1' pro_t1='0' pro_t2='3' pro_t3='2'
			 pro_t4='1'/>
		<z:row pro_numpro='35633' pro_nom='PATE FEUILLETÉE CUITE' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='35647' pro_nom='CHAUSSON AUX CERISES CUITES' pro_critere='A1' pro_t1='0' pro_t2='10' pro_t3='5'
			 pro_t4='1'/>
		<z:row pro_numpro='35651' pro_nom='TAPENADE MAISON' pro_critere='A5' pro_t1='0' pro_t2='12' pro_t3='1' pro_t4='3'/>
	</rs:insert>
</rs:data>
</xml>
