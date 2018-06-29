FROM golang

RUN go get github.com/dirkarnez/go-plugin-example

WORKDIR $GOPATH/src/github.com/dirkarnez/go-plugin-example
VOLUME ["$GOPATH/src/github.com/dirkarnez/go-plugin-example/build"]

CMD go build -buildmode=plugin -o build/eng.so eng/greeter.go && \ 
    go build -buildmode=plugin -o build/chi.so chi/greeter.go && \
    go run greeter.go english && \
    go run greeter.go chinese