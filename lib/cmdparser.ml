let do_hash hash_length file =
  let open Core in
  Md5.digest_file_blocking file
  |> Md5.to_hex
  |> (fun s -> String.prefix s hash_length)
  |> print_endline

let command =
  Command.basic
    ~summary:"Generate an MD5 hash of the input data"
    ~readme:(fun () -> "More details information")
    (let open Command.Let_syntax in
     let open Command.Param in
     let%map hash_length = anon ("hash_length" %: int)
     and filename = anon ("filename" %: string) in
     fun () -> do_hash hash_length filename)

