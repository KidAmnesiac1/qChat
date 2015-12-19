allUsrs:()!();

msgLog:{[u;m] ssr[;"\n";""] raze string[u],enlist["@"],string[`minute$.z.T],": ",m};

toStr:  {$[10 = abs type x; x; string x]};
toSym:  {$[11 = abs type x; x; `$toStr[x]]};



.z.po:{
	

	// Port opens
	if[not x = 0;
		name: toStr x "name";	
		neg[key allUsrs]@\:(show; name," has joined the room");

		// User name and handle stored in dict
		`allUsrs set allUsrs,enlist[x]!enlist[toSym name];

		// Returns people in room
		usrs:string distinct value allUsrs;

		neg[x](show;"Present in room: ",(", " sv usrs));
	];

	};

.z.pc:{

	x:`int$x;

	// Get user name
	usr: allUsrs[x];

	// Remove unser from dict
	allUsrs::allUsrs _ x;

	// Notify room of exit
	neg[key allUsrs]@\:(show; toStr[usr]," has left the room");


	};

.z.ps:{
	
	u:allUsrs[.z.w];
	
	// Receive message
	if[not all x like enlist "\n";	
		neg'[key[allUsrs] except .z.w]@\:(show; msgLog[u;x])]


	};

.z.pg:{neg[.z.w]"No synch messaging"};

.z.exit:{ neg[key allUsrs]@\:"exit"};


if[0=system"p"; system "p 1234"];

