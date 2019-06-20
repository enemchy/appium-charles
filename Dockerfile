FROM budtmo/docker-android-x86-6.0:1.8-p2
RUN wget -q -O - https://www.charlesproxy.com/packages/apt/PublicKey | apt-key add - \
    && sh -c 'echo deb https://www.charlesproxy.com/packages/apt/ charles-proxy main > /etc/apt/sources.list.d/charles.list' \
    && apt-get update \
    && apt-get install charles-proxy
