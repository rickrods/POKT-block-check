# POKT-block-check
Verifies that the block height is progressing and restarts the service if not 

save this script as /home/pocket/.pocket/block_checker.sh
 
```
chmod +x /home/pocket/.pocket/block_checker.sh
crontab -e
```
*/30 * * * * /home/pocket/.pocket/block_checker.sh > /home/pocket/.pocket/block_checker.log
