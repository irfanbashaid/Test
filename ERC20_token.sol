pragma solidity ^0.4.0;
contract ERC20
{
    string name;
    string symbol;
    uint8 decimals;
    address owner;
    function ERC20()
    {
        name = "ANYBODYCAN";
        symbol = "ABC";
        decimals = 18;
        owner=msg.sender;
    }
    mapping(address=>uint256)balance;
    modifier check_mint(uint256 _value_to_mint)
    {
        require(_value_to_mint<=totalSupply() && owner==msg.sender);
        _;
    }
    modifier check_balance(uint256 _value)
    {
        require(balance[msg.sender]>=_value && owner==msg.sender);
        _;
    }
    modifier check_transfer(address _from,uint256 _value)
    {
        require(balance[_from]<=_value);
        _;
    }
    function totalSupply() private returns(uint256)
    {
        uint256 totalsupply=100000;
        return totalsupply;
    }
    function transfer(address to,uint256 value) check_balance(value)
    {
        balance[to]+=value;
        balance[msg.sender]-=value;
    }
    function mint(uint256 value_to_mint) check_mint(value_to_mint)
    {
        balance[msg.sender]+=value_to_mint;
    }
    function balanceOf(address acc) returns(uint256)
    {
        return balance[acc];
    }
    function transferFrom(address from,address to,uint256 value) check_transfer(from,value) returns(bool) 
    {
        balance[from]-=value;
        balance[to]+=value;
        return true;
    }
}
