FROM sbtscala/scala-sbt:eclipse-temurin-jammy-19.0.1_10_1.8.2_3.2.2

RUN apt-get update && apt-get install -y \
    zsh \
    git \
    graphviz \
    && rm -rf /var/lib/apt/lists/*

# Get and configure oh-my-zsh for root 
COPY zsh-commands.txt /tmp
WORKDIR /root
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
RUN cat /tmp/zsh-commands.txt >> ~/.zshrc