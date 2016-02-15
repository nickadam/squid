# squid
A simple docker build for squid

Build it

    git clone https://github.com/nickadam/squid.git
    docker build -t squid squid/

Run it

    docker run -d -p 127.0.0.1:3128:3128 squid
