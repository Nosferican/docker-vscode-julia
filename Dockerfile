FROM codercom/code-server
ENV JULIA_VERSION=1.3.1
RUN cd /usr/local/bin \
    && sudo mkdir julia_dir \
    && cd julia_dir \
    && sudo wget -q https://julialang-s3.julialang.org/bin/linux/x64/`echo ${JULIA_VERSION} | cut -d. -f 1,2`/julia-${JULIA_VERSION}-linux-x86_64.tar.gz \
    && echo "faa707c8343780a6fe5eaf13490355e8190acf8e2c189b9e7ecbddb0fa2643ad *julia-${JULIA_VERSION}-linux-x86_64.tar.gz" | sha256sum -c - \
    && sudo tar fxz julia-${JULIA_VERSION}-linux-x86_64.tar.gz \
    && sudo rm -R julia-${JULIA_VERSION}-linux-x86_64.tar.gz \
    && cd .. \
    && sudo ln -s julia_dir/julia-${JULIA_VERSION}/bin/julia julia \
    && sudo wget https://github.com/julia-vscode/julia-vscode/releases/download/v0.13.1/language-julia-0.13.1.vsix \
    && code-server --install-extension language-julia-0.13.1.vsix \
    && sudo rm language-julia-0.13.1.vsix \
    && code-server --install-extension colinfang.markdown-julia \
    && code-server --install-extension bungcip.better-toml \
    && code-server --install-extension yzhang.markdown-all-in-one \
    && code-server --install-extension jdforsythe.add-new-line-to-files
