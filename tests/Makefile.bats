setup() {
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
}

@test "TARGET_DIRの環境変数が設定されていない場合エラーになること" {
    run make check
    [ "$status" -ne 0 ]
    [[ "$output" =~ "TARGET_DIRの環境変数を設定してください" ]]
    [[ "$output" =~ "ex: export TARGET_DIR=/Path/To/Target/Dir" ]]
}
