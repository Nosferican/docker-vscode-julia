FROM codercom/code-server
ENV JULIA_VERSION=1.4.0-rc1
RUN cd /usr/local/bin \
    && sudo mkdir julia_dir \
    && cd julia_dir \
    && sudo wget -q https://julialang-s3.julialang.org/bin/linux/x64/`echo ${JULIA_VERSION} | cut -d. -f 1,2`/julia-${JULIA_VERSION}-linux-x86_64.tar.gz \
    && echo "9996a9dc0547a97da5157536354645f9a2729b22f35c3d0d9cb42190e6fe3c64 *julia-${JULIA_VERSION}-linux-x86_64.tar.gz" | sha256sum -c - \
    && sudo tar fxz julia-${JULIA_VERSION}-linux-x86_64.tar.gz \
    && sudo rm -R julia-${JULIA_VERSION}-linux-x86_64.tar.gz \
    && cd .. \
    && sudo ln -s julia_dir/julia-${JULIA_VERSION}/bin/julia julia \
    && code-server --install-extension julialang.language-julia \
    && code-server --install-extension colinfang.markdown-julia \
    && code-server --install-extension bungcip.better-toml \
    && code-server --install-extension yzhang.markdown-all-in-one \
    && code-server --install-extension jdforsythe.add-new-line-to-files
