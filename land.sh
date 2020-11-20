# Created on oct, 2020
# @Author Rahul S Koimattur.
# @brief  Land attack is a TCP/UDP/ICMP packet with a source address same as the destination 
#         address Retrives systems IP address using the dig command to check for Land Attack
#         and once confirmed, Logs and drops the packets.

myip="$(dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com)"
SUBSTRING=`echo "$myip" | cut -d'"' -f 2`
sudo iptables -A INPUT -s $SUBSTRING/32 -d $SUBSTRING/32 -j LOG --log-prefix "land attack drop" 
sudo iptables -A INPUT -s $SUBSTRING/32 -d $SUBSTRING/32 -j DROP


