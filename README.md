# Driver

Simple Framework for API Client.

Client, Model, APIを分離するアイデアです.

## Usage
使用法方は[ダミーアプリケーション](https://github.com/hiro-su/driver/tree/master/spec/dummy)を参照

## Architecture
### Client
 - ユーザとのやり取りはすべてこのClient経由で行う。
 - 基本的にはモデルインスタンスを返却する。
 - APIを直接呼び出すことも可能。
 
### Model
 - APIからデータを取得し、自インスタンスをClientへ返却する。

### API
 - 実際にWebServerのAPIを叩く部分。
