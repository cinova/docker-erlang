FROM cinova/basedev
MAINTAINER Cinova Dev <dev@cinova.co>
RUN apt-get update
RUN apt-get -y upgrade
RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && \
    dpkg -i erlang-solutions_1.0_all.deb && \
    rm erlang-solutions_1.0_all.deb
RUN apt-get build-dep -y erlang yaws
RUN apt-get -y install erlang erlang-base-hipe erlang-manpages erlang-doc
RUN git clone https://github.com/rebar/rebar.git && \
    cd rebar && ./bootstrap && mv rebar /usr/local/bin/ && \
    cd ../ && rm -rf rebar
RUN curl -L -o ./lfetool https://raw.github.com/lfe/lfetool/dev-v1/lfetool && \
    bash ./lfetool install && rm lfetool
CMD ["erl"]
