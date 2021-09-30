pragma ton-solidity >= 0.47.0;
pragma AbiHeader expire;

import "./BasicToken.sol";

contract TokenExample is BasicToken {
    // Token parameters
    string public constant name     = "Token Example Coin";
    string public constant symbol   = "TEC";
    uint8  public constant decimals = 18;
    /**
     * @dev Auto generated interface IERC179 function.
     */
    uint public override totalSupply;
    uint public reserve;

    constructor(uint _value) public {
        require(msg.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();

        totalSupply = _value;
        reserve     = _value;
    }
    // bue (payable)
    function bue() public payable {
        balances[msg.sender] = balances[msg.sender].add(100);
    }
}