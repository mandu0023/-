pragma solidity ^0.4.23;
pragma experimental ABIEncoderV2;

contract agricultureContract {

    uint8 numberOfProducts; // 총 제품의 수입니다. // 재고
    //uint8 numberOfSell; //판매
    //uint8 numberOfSupply; //공급
    //uint8 numberOfDiscard; //폐기
    address contractOwner;

    struct myStruct {
        string mName;
        string parName;
        //uint numProducts;
        uint supplyNum;
        uint sellNum;
        uint discardNum;
        string busiName;
        uint stockNum;
    }

    myStruct[] public productes;

    constructor() public {        
        contractOwner = msg.sender;
    }

    function addsupplyProStru (string _mName, string _parName, string _busiName, uint _supplyNum) public {
        
        bool isNotfirst = true;
        for(uint8 i = 0; i<numberOfProducts; i++)
        {   
            if(keccak256(productes[i].mName) == keccak256(_mName))
            {
                uint psupplyNum =  productes[i].supplyNum + _supplyNum;
                uint psellNum = productes[i].sellNum;
                uint pdiscardNum = productes[i].discardNum;
                uint pstockNum = productes[i].stockNum + _supplyNum;
                productes.push(myStruct(_mName, _parName, psupplyNum ,psellNum, pdiscardNum, _busiName, pstockNum)) -1;
                numberOfProducts++;
                isNotfirst = false;
            }
            
        }
        
        if(isNotfirst==true)
        {
            productes.push(myStruct(_mName, _parName, _supplyNum ,0, 0, _busiName, 0)) -1;
            numberOfProducts++;
        }

    }
    
    function addsellProStru (string mName, string parName, uint sellNum) public {
       
        for(uint8 i = 0; i<numberOfProducts; i++)
        {   
            if(keccak256(productes[i].mName) == keccak256(mName))
            {
                uint psupplyNum = productes[i].supplyNum;
                uint psellNum = productes[i].sellNum+sellNum;
                uint pstockNum = productes[i].stockNum - sellNum;
                uint pdiscardNum = productes[i].discardNum;
                string pbusiName = productes[i].busiName;
                productes.push(myStruct(mName, parName, psupplyNum,psellNum, pdiscardNum, pbusiName, pstockNum)) -1;
                numberOfProducts++;
            }
        }
    }
    
    function adddiscardProStru (string mName, string parName, uint discardNum) public {
       
        for(uint8 i = 0; i<numberOfProducts; i++)
        {   
            if(keccak256(productes[i].mName) == keccak256(mName))
            {
                uint psellNum = productes[i].sellNum;
                uint pdiscardNum = productes[i].discardNum+discardNum;
                uint pstockNum = productes[i].stockNum - discardNum;
                uint psupplyNum = productes[i].supplyNum;
                string pbusiName = productes[i].busiName;
                productes.push(myStruct(mName, parName, psupplyNum,psellNum,pdiscardNum, pbusiName, pstockNum)) -1;
                numberOfProducts++;
            }
        }
    }

    //제품 등록의 수를 리턴합니다.
    function getNumOfProducts() public constant returns(uint8) {
        return numberOfProducts;
    }
    
    function getAllproducts() public view returns (myStruct[]) {
        return productes;
        
    }
    
    //번호에 해당하는 제품의 이름을 리턴합니다.
    function getProductStruct(uint _index) public view returns (string, string, uint, uint, uint, string, uint) {
        return (productes[_index].mName,productes[_index].parName, productes[_index].supplyNum, productes[_index].sellNum, productes[_index].discardNum, productes[_index].busiName, 
        productes[_index].stockNum);
    }

    //컨트랙트를 삭제합니다.
    function killContract() public {
        if(contractOwner == msg.sender)
            selfdestruct(contractOwner);
    }
    
    function findMedicine(string name) public view returns (string,string, uint, uint, uint, string, uint)
    {
        for(uint _index = 0; _index < numberOfProducts; _index++)
        {
            if(keccak256(productes[_index].mName) == keccak256(name))
            {
                return (productes[_index].mName,productes[_index].parName, productes[_index].supplyNum, productes[_index].sellNum, productes[_index].discardNum, productes[_index].busiName, 
        productes[_index].stockNum);
            }
        }
    }
    
    //function getSupplyProducts(unit _index)
    //{
    //    return (productes[_index].supplyNum);
    //}
}