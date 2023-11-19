FROM rust:1.74.0 as builder

WORKDIR /usr/src/app
COPY . .
# Will build and cache the binary and dependent crates in release mode
RUN --mount=type=cache,target=/usr/local/cargo,from=rust:1.74.0,source=/usr/local/cargo \
    --mount=type=cache,target=target \
    rustup default nightly; \
    cargo build --release && mv ./target/release/iankim ./iankim

# Runtime image
FROM ubuntu:23.10

# Run as "app" user
RUN useradd -ms /bin/bash app

USER app
WORKDIR /app

# Get compiled binaries from builder's cargo install directory
COPY --from=builder /usr/src/app/iankim /app/iankim
COPY --from=builder /usr/src/app/templates /app/templates
COPY --from=builder /usr/src/app/blogs /app/blogs
COPY --from=builder /usr/src/app/static /app/static
COPY --from=builder /usr/src/app/Rocket.toml /app/Rocket.toml

# Run the app
CMD ./iankim
