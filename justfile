APP := "f2"

test:
	@go test ./... --json -coverprofile=coverage.out -coverpkg . | gotestfmt -hide 'empty-packages'

[no-cd]
test-pkg filter='.*':
    @go test --json -coverprofile=coverage.out -coverpkg=../ -run={{filter}} | gotestfmt

[no-cd]
update-golden filter='.*':
    @go test --update --json -run={{filter}} | gotestfmt

build:
	@go build -o bin/{{APP}} ./cmd...

lint:
	@golangci-lint run ./...

pre-commit:
	@pre-commit run

clean:
	@rm -r bin
	@go clean

sloc:
  tokei
