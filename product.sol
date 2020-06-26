pragma solidity ^0.4.23;
pragma experimental ABIEncoderV2;

contract agricultureContract {

    uint8 numberOfProducts; // �� ��ǰ�� ���Դϴ�. // ���
    //uint8 numberOfSell; //�Ǹ�
    //uint8 numberOfSupply; //����
    //uint8 numberOfDiscard; //���
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

    //��ǰ ����� ���� �����մϴ�.
    function getNumOfProducts() public constant returns(uint8) {
        return numberOfProducts;
    }
    
    function getAllproducts() public view returns (myStruct[]) {
        return productes;
        
    }
    
    //��ȣ�� �ش��ϴ� ��ǰ�� �̸��� �����մϴ�.
    function getProductStruct(uint _index) public view returns (string, string, uint, uint, uint, string, uint) {
        return (productes[_index].mName,productes[_index].parName, productes[_index].supplyNum, productes[_index].sellNum, productes[_index].discardNum, productes[_index].busiName, 
        productes[_index].stockNum);
    }

    //��Ʈ��Ʈ�� �����մϴ�.
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