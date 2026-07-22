FROM hexletbasics/base-image:latest

RUN apt-get update && apt-get install -y default-jdk-headless

RUN curl -fsSL https://github.com/VirtusLab/scala-cli/releases/latest/download/scala-cli-x86_64-pc-linux.gz \
  | gzip -d > /usr/local/bin/scala-cli && chmod +x /usr/local/bin/scala-cli

WORKDIR /exercises-scala

COPY . .

ENV PATH=/exercises-scala/bin:$PATH

# Warm up the Scala toolchain cache (compiler + deps) so tests need no network
RUN cd modules/10-basics/10-hello-world && scala-cli run --server=false --jvm system index.scala >/dev/null 2>&1
