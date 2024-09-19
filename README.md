
# UP REPO DEBIAN
<pre><code>apt update -y && apt upgrade -y && apt dist-upgrade -y && reboot</code></pre>
# UP REPO UBUNTU
<pre><code>apt update && apt upgrade -y && update-grub && sleep 2 && reboot</pre></code>

# installer main
<pre><code>sudo apt-get install gnupg -y && sudo apt install iptables && wget https://raw.githubusercontent.com/scriswan/fodder/main/main.sh && chmod +x main.sh && ./main.sh</pre></code>

# Update sc Manual
<pre><code>wget https://raw.githubusercontent.com/scriswan/v1/main/pdkt.sh && chmod +x pdkt.sh && ./pdkt.sh</code></pre>

# offkan ipv6 baris 1
<pre><code>sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1</code></pre>

# offkan ipv6 baris 2
<pre><code>sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1</code></pre>
