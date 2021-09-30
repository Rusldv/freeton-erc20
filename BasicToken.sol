pragma ton-solidity >= 0.47.0;
pragma AbiHeader expire;

import "./IERC179.sol";
import "./SafeMath.sol";

/**
 * @dev This contract implementation ERC179 standart interface.
 * Warning: Here don't realisation Owners checking and any required!
 * Extend your contract from `BasicToken` to create your token.
 */
abstract contract BasicToken is IERC179 {
    /**
     * @dev Include Safe Math library in the contract.
     */
    using SafeMath for uint;

    mapping (address => uint) balances;

    function balanceOf(address _owner) external override  view returns (uint) {
        return balances[_owner];
    }

    function transfer(address _to, uint _value) external override returns (bool) {
        require(_to != address(0));
        require(_value <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}