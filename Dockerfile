FROM budtmo/docker-android-x86-6.0:1.8-p2
RUN wget -q -O - https://www.charlesproxy.com/packages/apt/PublicKey | apt-key add - \
    && sh -c 'echo deb https://www.charlesproxy.com/packages/apt/ charles-proxy main > /etc/apt/sources.list.d/charles.list' \
    && apt-get update \
    && apt-get install charles-proxy

RUN echo '\n\
[program:charles]\n\
command=/usr/bin/charles\n\
autorestart=true\n\
stdout_logfile=%(ENV_LOG_PATH)s/charles.stdout.log\n\
stderr_logfile=%(ENV_LOG_PATH)s/charles.stderr.log\n\
priority=1\n'\
  >> supervisord.conf
