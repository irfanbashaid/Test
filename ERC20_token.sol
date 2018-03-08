pragma solidity ^0.4.0;
contract ERC20
{
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 totalsupply;
    address owner;
    function ERC20()
    {
        name = "ANYBODYCAN";
        symbol = "ABC";
        decimals = 18;
        totalsupply=100000;
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
    function totalSupply() returns(uint256)
    {
        return totalsupply;
    }
    function transfer(address to,uint256 value) check_balance(value) returns(bool)
    {
        balance[to]+=value;
        balance[msg.sender]-=value;
        return true;
    }
    function mint(uint256 value_to_mint) check_mint(value_to_mint) returns(uint256)
    {
        balance[msg.sender]+=value_to_mint;
        return balance[msg.sender];
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
