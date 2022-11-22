// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "/Users/juliapak/node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "/Users/juliapak/node_modules/@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "/Users/juliapak/node_modules/@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

//get the prices! for eth
contract PriceConsumerV3 {
    AggregatorV3Interface internal priceFeed;

    /**
     * Network: Rinkeby
     * Aggregator: ETH/USD
     * Address: 0x01BE23585060835E02B77ef475b0Cc51aA1e0709
     */
    constructor() {
        priceFeed = AggregatorV3Interface(
            0x9326BFA02ADD2366b30bacB125260Af641031331
        );
    }

    /**
     * Returns the latest price
     */
    function getLatestPrice() public view returns (int256) {
        (
            ,
            /*uint80 roundID*/
            int256 price, /*uint startedAt*/ /*uint timeStamp*/ /*uint80 answeredInRound*/
            ,
            ,

        ) = priceFeed.latestRoundData();
        return price;
    }
}
