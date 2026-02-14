#Stage 1: build
FROM python:3.10.2-slim as build

WORKDIR /app

COPY pyproject.toml ./

RUN pip install --no-cache-dir --upgrade pip setuptools
RUN pip install --no-cache-dir --user -e .

# Stage 2: runtime
FROM python:3.10.2-slim as runtime

COPY --from=build /root/.local /home/appuser/.local

RUN useradd -m -u 1000 appuser

WORKDIR /app

COPY --chown=appuser:appuser . .

ENV PATH=/home/appuser/.local/bin:$PATH

USER appuser

EXPOSE 8075

CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8075"]

# Stage 3: test-build
FROM build as test-build

RUN pip install --no-cache-dir --user -e ".[test]"


WORKDIR /app


COPY . .

ENV PYTHONPATH /app
ENV PATH=/root/.local/bin:$PATH

CMD ["pytest", "tests/", "-v"]
