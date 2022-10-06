// SPDX-License-Identifier: MIT
pragma solidity > 0.4.0 <= 0.9.0;

// contract address = '0x2e523E76aDA83Db403DD6c1F56FE38858E28254B'
contract stakingGame {
    uint public  Nplayers;
    uint public stakingAmount;
    address owner;

    function setGmaeInfo(uint _Nplayers, uint _amt) external {
        Nplayers = _Nplayers;
        stakingAmount = _amt;
        owner = msg.sender;
    }

    uint[] public higherStake;
    mapping(address => uint) public stakePool;
    uint count;
    uint public stakeVault;
    address[] stakers;

    function stake(uint stakeFee, address staker) external {
        require(stakeFee >= stakingAmount && count != Nplayers && owner != msg.sender);
        if(stakeFee > stakingAmount) {
            uint aval = stakeFee - stakingAmount;
            higherStake.push(aval);
        }
        stakePool[staker] = stakeFee;
        count++;
        stakeVault = stakeVault + stakeFee;
        stakers.push(staker);
    }

    function refund(address _faintedOne, uint stakeFee) external {
        require(count != Nplayers);
        stakeVault = stakeVault - stakeFee;
        delete stakePool[_faintedOne];
    }

    function selectWinner() external view returns(address) {
        for(uint i = 0; i < stakers.length; i++) {
            if(i == 2) {
                break;
            }
            return stakers[2];
        }
        
    }

    function withdraw(address champ) external {
        require(champ == stakers[2]);
        stakePool[stakers[2]] = stakeVault;
    }
}
