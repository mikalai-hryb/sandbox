#! /bin/bash

echo "Functions"


function func1() {
    echo "the function is running"
}

function func2() {
    echo $1 $2 $3 $4
}

function func3() {
    returningValue="Using function right now"
    echo ${returningValue}
}

function func4() {
    returningValue="I love linux"
    echo ${returningValue}
}
returningValue="I love Mac"
echo ${returningValue}

func1
func2 Hi this is me
func3
func4
echo ${returningValue}