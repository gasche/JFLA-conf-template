all: compile-examples thumbnail

compile-examples: build
    typst c --root . examples/test_article/main.typ build/test_article.pdf
    typst c --root . examples/jfla_minimal/jflart-example.typ build/jfla_minimal.pdf

thumbnail:
    typst c --root . examples/test_article/main.typ thumbnail.png --format png --pages 1

build:
    mkdir -p build

clean:
    rm -rf build
    rm -f thumbail.png
