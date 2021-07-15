pragma solidity 0.8.1;

contract mappingS{
    
    struct Ajo{
        address [] members;
        uint maximum_amount;
        uint maxMembers;
        address owner;
        mapping(address =>mapping(address=>uint))memberAllocations;
        bool open;
    }
    
    uint id;
    
    mapping(uint=>Ajo) public Ajos;
    
    function createAjo(uint maxMembers,uint maximum_amount)public {
        Ajo storage a=Ajos [id];
        a.minimum_amount = minimum_amount;
        a.owner=msg.sender;
        a.open=true;
        a.maxMember=maxMember;
        id++;
    }
    
    function joinAjo(uint _id) public payable{
        require(ajoID<id,"AJO doesn't exist");
        Ajo storage a=Ajos[_id];
        require(a.open==true,"sorry my guy, not open");
        require(a.members.lenght<a.maxMembers,"max no of members reached");
        require(msg.value>a.minimum_amount, 'you must deposit the min amount');
        require(a.aMember[msg.sender]==false,"OLE");
        a.members.push(msg.sender);
        a.amountDepo[msg.sender]+=msg.value;
        a.aMember[msg.sender]=true;
    }
    
    function giveMyMoney(address collector,uint howMuch,uint ajoID) public {
        require(ajoID<id,"AJO doesn't exist");
        Ajo storage a=Ajos[ajoID];
        require(a.aMember[msg.sender]==true && a.aMember[collector]==true, "the guy no dey here");
        require(a.amountDepo[msg.sender], howMuch,"OLE");
    }
    function withdrawMoney(uint ajoID) public returns(uint) {
        require(ajoID<id,"AJO doesn't exist");
        Ajo storage a=Ajos[ajoID];
        require(a.aMember[msg.sender]==true,'nope');
        require(a.amountDepo[msg.sender>0], dry pocket]);
        uint amountToWithdraw=a.amountDepo[msg.sender];
        a.amountDepo[msg.sender]=0;
        payable(msg.sender).transfer(amountToWithdraw);
        /**for(uint k;k<a.members.Lenght;k++){
            if(a.members[k]==msg.sender){
                delete a.member
    }
}
