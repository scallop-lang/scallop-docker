FROM pytorch/pytorch

RUN apt update && apt upgrade -y
RUN apt-get -y install git

RUN apt update && apt upgrade -y
RUN apt-get -y install curl

RUN apt update && apt upgrade -y
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN /bin/bash -c "source '$HOME/.cargo/env' ; rustup default nightly"

RUN apt update && apt upgrade -y
RUN apt install -y make

RUN apt update && apt upgrade -y
RUN apt install -y build-essential


WORKDIR /root
RUN git clone https://github.com/scallop-lang/scallop.git
WORKDIR /root/scallop

RUN /bin/bash -c "source '$HOME/.cargo/env' ; make install-scli"
RUN /bin/bash -c "source '$HOME/.cargo/env' ; make install-sclc"
RUN /bin/bash -c "source '$HOME/.cargo/env' ; make install-sclrepl"


RUN pip install maturin
RUN /bin/bash -c "source '$HOME/.cargo/env' ; make install-scallopy"





