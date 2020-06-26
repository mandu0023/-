var abi = 
[
	{
		"constant": false,
		"inputs": [
			{
				"name": "mName",
				"type": "string"
			},
			{
				"name": "parName",
				"type": "string"
			},
			{
				"name": "discardNum",
				"type": "uint256"
			}
		],
		"name": "adddiscardProStru",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "mName",
				"type": "string"
			},
			{
				"name": "parName",
				"type": "string"
			},
			{
				"name": "sellNum",
				"type": "uint256"
			}
		],
		"name": "addsellProStru",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_mName",
				"type": "string"
			},
			{
				"name": "_parName",
				"type": "string"
			},
			{
				"name": "_busiName",
				"type": "string"
			},
			{
				"name": "_supplyNum",
				"type": "uint256"
			}
		],
		"name": "addsupplyProStru",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [],
		"name": "killContract",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"constant": true,
		"inputs": [
			{
				"name": "name",
				"type": "string"
			}
		],
		"name": "findMedicine",
		"outputs": [
			{
				"name": "",
				"type": "string"
			},
			{
				"name": "",
				"type": "string"
			},
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "string"
			},
			{
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "getAllproducts",
		"outputs": [
			{
				"components": [
					{
						"name": "mName",
						"type": "string"
					},
					{
						"name": "parName",
						"type": "string"
					},
					{
						"name": "supplyNum",
						"type": "uint256"
					},
					{
						"name": "sellNum",
						"type": "uint256"
					},
					{
						"name": "discardNum",
						"type": "uint256"
					},
					{
						"name": "busiName",
						"type": "string"
					},
					{
						"name": "stockNum",
						"type": "uint256"
					}
				],
				"name": "",
				"type": "tuple[]"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "getNumOfProducts",
		"outputs": [
			{
				"name": "",
				"type": "uint8"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"name": "_index",
				"type": "uint256"
			}
		],
		"name": "getProductStruct",
		"outputs": [
			{
				"name": "",
				"type": "string"
			},
			{
				"name": "",
				"type": "string"
			},
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "string"
			},
			{
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"name": "productes",
		"outputs": [
			{
				"name": "mName",
				"type": "string"
			},
			{
				"name": "parName",
				"type": "string"
			},
			{
				"name": "supplyNum",
				"type": "uint256"
			},
			{
				"name": "sellNum",
				"type": "uint256"
			},
			{
				"name": "discardNum",
				"type": "uint256"
			},
			{
				"name": "busiName",
				"type": "string"
			},
			{
				"name": "stockNum",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	}
]