# Dockerfile for binder
# Reference:
# https://mybinder.readthedocs.io/en/latest/dockerfile.html#preparing-your-dockerfile

FROM sagemath/sagemath:9.0
RUN sage -pip install tqdm RISE pynormaliz
RUN echo "jupyter-nbextension install rise --py --sys-prefix" | sage -sh
RUN echo "jupyter-nbextension enable rise --py --sys-prefix" | sage -sh

# Copy the contents of the repo in ${HOME}
COPY --chown=sage:sage . ${HOME}
