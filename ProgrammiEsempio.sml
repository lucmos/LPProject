(**************************** DISPENSE ***********************************)

val programmaStatDin = codiceS( 
[
	defClasseS(
	        nomeCl "A",
	        Object,
	        [
	           defCampoS ( intS, nomeC ("f"), intExprS 1) 
	        ],
	        [
	            defMetodoS ( intS, nomeM "get_f", [], [], [returnS (accessoCampoS( thisS, nomeC "f"))])
	        ]
	        ),

	defClasseS(
	        nomeCl "B",
	        nomeCl "A",
	        [
	            defCampoS ( intS, nomeC ("f"), intExprS 2)
	        ],
	        [
	            defMetodoS ( intS, nomeM "get_f", [], [], [returnS (accessoCampoS( thisS, nomeC "f"))])
	        ]
	        ),

	defClasseS(
	        nomeCl "esempio",
	        Object,
	        [],
	        [
	            defMetodoS ( intS, nomeM "main", 
	            	[	           ], (*args*)
	            	[
	            		defVarS( classeS( nomeCl "A"), (nomeV "b")),
	            		defVarS( intS, (nomeV "res1")),
	            		defVarS( intS, (nomeV "res2"))
	            	], (*locals*)
	            	[ 
	            		assegnamentoVarS( varExprS(nomeV "res1"), accessoCampoS( varExprS(nomeV "b"), nomeC "f")),
	            		assegnamentoVarS( varExprS(nomeV "res2"), chiamataMetodoS (varExprS(nomeV "b") , nomeM "get_f" , [])),

	            		returnS ( intExprS 0)
	            	]) (*cmds*)
	        ]
	        )
]
);



val programmaWeird = codiceS( 
[
	defClasseS(
	        nomeCl "A",
	        Object,
	        [
	           defCampoS ( intS, nomeC ("f"), chiamataMetodoS (( thisS) , nomeM "m" , [])) 



	        ],
	        [
	            defMetodoS ( intS, nomeM "m", [], [], [returnS (intExprS 3)])
	        ]
	        ),

	defClasseS(
	        nomeCl "B",
	        nomeCl "A",
	        [
	            defCampoS ( intS, nomeC ("g"),chiamataMetodoS (( thisS) , nomeM "m" , []))
	        ],
	        [
	            defMetodoS ( intS, nomeM "m", [], [], [returnS (accessoCampoS(  thisS, nomeC "g"))])
	        ]
	        ),

	defClasseS(
	        nomeCl "weird",
	        Object,
	        [],
	        [
	            defMetodoS ( intS, nomeM "main", 
	            	[	           ], (*args*)
	            	[defVarS( classeS( nomeCl "B"), (nomeV "b"))], (*locals*)
	            	[ assegnamentoVarS( varExprS(nomeV "b"), newS( nomeCl "B")) ,returnS (accessoCampoS( varExprS(nomeV "b"), nomeC "f"))]) (*cmds*)
	        ]
	        )
]
);

(**************************** VARIE ***********************************)

val programmaOverride1 = codiceS( 
[
	defClasseS(
	        nomeCl "A",
	        Object,
	        [
	        ],
	        [	        	
	        	defMetodoS ( intS, nomeM "get_f", [], [], [returnS (intExprS 1)])
	        ]
	        ),

	defClasseS(
	        nomeCl "B",
	        nomeCl "A",
	        [
	        ],
	        [
	        	defMetodoS ( classeS( nomeCl "A"), nomeM "get_f", [], [], [returnS (newS( nomeCl "B"))])
	        ]
	        ),

	defClasseS(
	        nomeCl "esempio",
	        Object,
	        [],
	        [
	            defMetodoS ( intS, nomeM "main", 
	            	[	           ], (*args*)
	            	[
	            		defVarS( classeS( nomeCl "A"), (nomeV "a")),
	            		defVarS( classeS( nomeCl "B"), (nomeV "b")),
	            		defVarS( intS, (nomeV "resA")),
	            		defVarS( classeS( nomeCl "A"), (nomeV "resB"))
	            	], (*locals*)
	            	[ 
	            		assegnamentoVarS( varExprS(nomeV "a"), newS( nomeCl "B")),
	            		assegnamentoVarS( varExprS(nomeV "b"), newS( nomeCl "B")),

	            		assegnamentoVarS( varExprS(nomeV "resA"), chiamataMetodoS (varExprS( (nomeV "a")) , nomeM "get_f" , [])),
	            		assegnamentoVarS( varExprS(nomeV "resB"), chiamataMetodoS (varExprS( (nomeV "b")) , nomeM "get_f" , [])),

	            		returnS ( intExprS 0)
					]) (*cmds*)
	        ]
	        )
]
);

val programmaOverride2 = codiceS( 
[
	defClasseS(
	        nomeCl "A",
	        Object,
	        [
	        ],
	        [	        	
	        	defMetodoS ( intS, nomeM "get_f", [], [], [returnS (intExprS 1)])
	        ]
	        ),

	defClasseS(
	        nomeCl "B",
	        nomeCl "A",
	        [
	        ],
	        [
	        	defMetodoS ( classeS( nomeCl "A"), nomeM "get_f", [], [], [returnS (newS( nomeCl "B"))])
	        ]
	        ),

	defClasseS(
	        nomeCl "esempio",
	        Object,
	        [],
	        [
	            defMetodoS ( intS, nomeM "main", 
	            	[	           ], (*args*)
	            	[
	            		defVarS( classeS( nomeCl "A"), (nomeV "a")),
	            		defVarS( classeS( nomeCl "B"), (nomeV "b")),
	            		defVarS( intS, (nomeV "resA")),
	            		defVarS( classeS( nomeCl "A"), (nomeV "resB"))
	            	], (*locals*)
	            	[ 
	            		assegnamentoVarS( varExprS(nomeV "a"), newS( nomeCl "B")),
	            		assegnamentoVarS( varExprS(nomeV "b"), newS( nomeCl "B")),

	            		assegnamentoVarS( varExprS(nomeV "resA"), chiamataMetodoS (( varExprS(nomeV "b")) , nomeM "get_f" , [])),
	            		assegnamentoVarS( varExprS(nomeV "resB"), chiamataMetodoS (( varExprS(nomeV "a")) , nomeM "get_f" , [])),

	            		returnS ( intExprS 0)
					]) (*cmds*)
	        ]
	        )
]
);

val programmaOverride3 = codiceS( 
[
	defClasseS(
	        nomeCl "A",
	        Object,
	        [
	        ],
	        [	        	
	        	defMetodoS ( intS, nomeM "get_f", [], [], [returnS (intExprS 1)])
	        ]
	        ),

	defClasseS(
	        nomeCl "B",
	        nomeCl "A",
	        [
	        ],
	        [
	        	defMetodoS ( classeS( nomeCl "A"), nomeM "get_f", [], [], [returnS (newS( nomeCl "B"))])
	        ]
	        ),

	defClasseS(
	        nomeCl "esempio",
	        Object,
	        [],
	        [
	            defMetodoS ( intS, nomeM "main", 
	            	[	           ], (*args*)
	            	[
	            		defVarS( classeS( nomeCl "A"), (nomeV "a")),
	            		defVarS( classeS( nomeCl "B"), (nomeV "b")),
	            		defVarS( intS, (nomeV "resA")),
	            		defVarS( intS, (nomeV "resB"))
	            	], (*locals*)
	            	[ 
	            		assegnamentoVarS( varExprS(nomeV "a"), newS( nomeCl "B")),
	            		assegnamentoVarS( varExprS(nomeV "b"), newS( nomeCl "B")),

	            		assegnamentoVarS( varExprS(nomeV "resA"), chiamataMetodoS (( varExprS(nomeV "b")) , nomeM "get_f" , [])),
	            		assegnamentoVarS( varExprS(nomeV "resB"), chiamataMetodoS (( varExprS(nomeV "a")) , nomeM "get_f" , [])),

	            		returnS ( intExprS 0)
					]) (*cmds*)
	        ]
	        )
]
);

val programmaOverride4 = codiceS( 
[
	defClasseS(
	        nomeCl "A",
	        Object,
	        [
	        ],
	        [	        	
	        	defMetodoS ( intS, nomeM "get_f", [], [], [returnS (intExprS 1)])
	        ]
	        ),

	defClasseS(
	        nomeCl "B",
	        nomeCl "A",
	        [
	        ],
	        [
	        ]
	        ),

	defClasseS(
	        nomeCl "esempio",
	        Object,
	        [],
	        [
	            defMetodoS ( intS, nomeM "main", 
	            	[	           ], (*args*)
	            	[
	            		defVarS( classeS( nomeCl "A"), (nomeV "a")),
	            		defVarS( classeS( nomeCl "B"), (nomeV "b")),
	            		defVarS( intS, (nomeV "resA")),
	            		defVarS( intS, (nomeV "resB"))
	            	], (*locals*)
	            	[ 
	            		assegnamentoVarS( varExprS(nomeV "a"), newS( nomeCl "B")),
	            		assegnamentoVarS( varExprS(nomeV "b"), newS( nomeCl "B")),

	            		assegnamentoVarS( varExprS(nomeV "resA"), chiamataMetodoS (( varExprS(nomeV "b")) , nomeM "get_f" , [])),
	            		assegnamentoVarS( varExprS(nomeV "resB"), chiamataMetodoS (( varExprS(nomeV "a")) , nomeM "get_f" , [])),

	            		returnS ( intExprS 0)
					]) (*cmds*)
	        ]
	        )
]
);

val programmaInizializzazione1 = codiceS( 
[
	defClasseS(
	        nomeCl "A",
	        Object,
	        [
	            defCampoS ( intS, nomeC ("f"), intExprS 2)
	        ],
	        [
	        ]
	        ),

	defClasseS(
	        nomeCl "esempio",
	        Object,
	        [],
	        [
	            defMetodoS ( intS, nomeM "main", 
	            	[	           ], (*args*)
	            	[
	            		defVarS( classeS( nomeCl "A"), (nomeV "a"))
	            	], (*locals*)
	            	[ 
	            		returnS ( accessoCampoS( varExprS( (nomeV "a")), nomeC "f"))
	            	]) (*cmds*)
	        ]
	        )
]
);

val programmaInizializzazione2 = codiceS( 
[
	defClasseS(
	        nomeCl "A",
	        Object,
	        [
	        ],
	        [
	    		defMetodoS ( intS, nomeM "get_f", [], [], [returnS (intExprS 1)])
	        ]
	        ),

	defClasseS(
	        nomeCl "esempio",
	        Object,
	        [],
	        [
	            defMetodoS ( intS, nomeM "main", 
	            	[	           ], (*args*)
	            	[
	            		defVarS( classeS( nomeCl "A"), (nomeV "a"))
	            	], (*locals*)
	            	[ 
	            		returnS ( chiamataMetodoS (varExprS( (nomeV "a")) , nomeM "get_f" , []) )
	            	]) (*cmds*)
	        ]
	        )
]
);

val programmaInizializzazione3 = codiceS( 
[
	defClasseS(
	        nomeCl "A",
	        Object,
	        [
	        ],
	        [
	        ]
	        ),

	defClasseS(
	        nomeCl "esempio",
	        Object,
	        [],
	        [
	            defMetodoS ( intS, nomeM "main", 
	            	[	           ], (*args*)
	            	[
	            	], (*locals*)
	            	[ 
	            		assegnamentoVarS( intExprS 5, intExprS 10),
	            		returnS ( intExprS 0 )
	            	]) (*cmds*)
	        ]
	        )
]
);

val programmaVisibilita1 = codiceS( 
[
	defClasseS(
	        nomeCl "A",
	        Object,
	        [
	        ],
	        [
	        ]
	        ),

	defClasseS(
	        nomeCl "B",
	        nomeCl "A",
	        [
	            defCampoS ( intS, nomeC ("f"), intExprS 2)
	        ],
	        [
	        ]
	        ),

	defClasseS(
	        nomeCl "esempio",
	        Object,
	        [],
	        [
	            defMetodoS ( intS, nomeM "main", 
	            	[	           ], (*args*)
	            	[
	            		defVarS( classeS( nomeCl "A"), (nomeV "a"))
	            	], (*locals*)
	            	[ 
	            		assegnamentoVarS( varExprS(nomeV "a"), newS( nomeCl "B")),
	            		returnS ( accessoCampoS(( varExprS(nomeV "a")), nomeC "f"))
	            	]) (*cmds*)
	        ]
	        )
]
);

val programmaVisibilita2 = codiceS( 
[
	defClasseS(
	        nomeCl "A",
	        Object,
	        [
	        ],
	        [
	        ]
	        ),

	defClasseS(
	        nomeCl "B",
	        nomeCl "A",
	        [
	        ],
	        [
	        	defMetodoS ( intS, nomeM "get_f", [], [], [returnS (intExprS 1)])
	        ]
	        ),

	defClasseS(
	        nomeCl "esempio",
	        Object,
	        [],
	        [
	            defMetodoS ( intS, nomeM "main", 
	            	[	           ], (*args*)
	            	[
	            		defVarS( classeS( nomeCl "A"), (nomeV "a"))
	            	], (*locals*)
	            	[ 
	            		assegnamentoVarS( varExprS(nomeV "a"), newS( nomeCl "B")),
	            		returnS ( chiamataMetodoS (( varExprS(nomeV "a")) , nomeM "get_f" , []) )
	            	]) (*cmds*)
	        ]
	        )
]
);

val programmaCast1 = codiceS( 
[
	defClasseS(
	        nomeCl "A",
	        Object,
	        [
	        ],
	        [
	        ]
	        ),

	defClasseS(
	        nomeCl "B",
	        nomeCl "A",
	        [
	            defCampoS ( intS, nomeC ("f"), intExprS 2)
	        ],
	        [
	        ]
	        ),

	defClasseS(
	        nomeCl "esempio",
	        Object,
	        [],
	        [
	            defMetodoS ( intS, nomeM "main", 
	            	[	           ], (*args*)
	            	[
	            		defVarS( classeS( nomeCl "A"), (nomeV "a")),
	            		defVarS( classeS( nomeCl "B"), (nomeV "b"))
	            	], (*locals*)
	            	[ 
	            		assegnamentoVarS( varExprS(nomeV "a"), newS( nomeCl "B")),
	            		assegnamentoVarS( varExprS(nomeV "b"), ( varExprS(nomeV "a"))),

	            		returnS ( accessoCampoS( ( varExprS(nomeV "a")), nomeC "f"))
	            	]) (*cmds*)
	        ]
	        )
]
);

val programmaCast2 = codiceS( 
[
	defClasseS(
	        nomeCl "A",
	        Object,
	        [
	        ],
	        [
	        ]
	        ),

	defClasseS(
	        nomeCl "B",
	        nomeCl "A",
	        [
	        ],
	        [
	        	defMetodoS ( intS, nomeM "get_f", [], [], [returnS (intExprS 1)])
	        ]
	        ),

	defClasseS(
	        nomeCl "esempio",
	        Object,
	        [],
	        [
	            defMetodoS ( intS, nomeM "main", 
	            	[	           ], (*args*)
	            	[
	            		defVarS( classeS( nomeCl "A"), (nomeV "a")),
	            		defVarS( classeS( nomeCl "B"), (nomeV "b"))
	            	], (*locals*)
	            	[ 
	            		assegnamentoVarS( varExprS(nomeV "a"), newS( nomeCl "B")),
	            		assegnamentoVarS( varExprS(nomeV "b"), ( varExprS(nomeV "a"))),

	            		returnS ( chiamataMetodoS (varExprS( (nomeV "a")) , nomeM "get_f" , []) )
	            	]) (*cmds*)
	        ]
	        )
]
);

val programmaCast3 = codiceS( 
[
	defClasseS(
	        nomeCl "A",
	        Object,
	        [
	        ],
	        [
	        ]
	        ),

	defClasseS(
	        nomeCl "B",
	        nomeCl "A",
	        [
	        ],
	        [
	        	defMetodoS ( intS, nomeM "get_f", [], [], [returnS (intExprS 1)])
	        ]
	        ),

	defClasseS(
	        nomeCl "esempio",
	        Object,
	        [],
	        [
	            defMetodoS ( intS, nomeM "main", 
	            	[	           ], (*args*)
	            	[
	            		defVarS( classeS( nomeCl "A"), (nomeV "a")),
	            		defVarS( classeS( nomeCl "B"), (nomeV "b")),

	            		defVarS( intS, nomeV "res")
	            	], (*locals*)
	            	[ 
	            		assegnamentoVarS( varExprS(nomeV "b"), newS( nomeCl "B")),
	            		assegnamentoVarS( varExprS( nomeV "res"), chiamataMetodoS (varExprS((nomeV "b")) , nomeM "get_f" , [])),
	            		assegnamentoVarS( varExprS(nomeV "a"), varExprS ((nomeV "b"))),
	            		assegnamentoVarS( varExprS( nomeV "res"), chiamataMetodoS (varExprS((nomeV "a")) , nomeM "get_f" , [])),
	            		returnS ( intExprS 0 )
	            	]) (*cmds*)
	        ]
	        )
]
);

