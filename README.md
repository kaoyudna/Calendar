# Calendar
<img width="1145" alt="スクリーンショット 2023-05-26 14 11 08" src="https://github.com/kaoyudna/Calendar/assets/121837465/b9f1d6c4-7df4-4ad2-98ea-f3d372cc199f">
<img width="1142" alt="スクリーンショット 2023-05-26 14 14 38" src="https://github.com/kaoyudna/Calendar/assets/121837465/c8225d2e-7515-4e4f-ad6a-e18ad764254f">

## サイト概要

### サイトテーマ
日々の学習の予定作成、実績確認を行うことができるカレンダーアプリ<br>
http://18.177.62.165

### テーマを選んだ理由
エンジニアとして学習を進めるにあたり、自己学習は大切です。<br>
しかし、ただ闇雲に学習してもいずれかはモチベーションが下がってしまう方もいるかと思われます。<br>
そんな方々へ是非、このアプリケーションを活用していただきたいと考えております。<br>
学習計画を立て、今までの学習量を把握することでモチベーションを保ちながら継続的な学習のサポートができればと思い、このアプリケーションを制作いたしました。

### ターゲットユーザー
- 計画的に学習を行いたい方
- 学習量を可視化したい方

### 主な利用シーン
- 自己学習を行う時

### アピールポイント
当アプリでは「ユーザビリティ」を一番に意識して制作にこだわりました。例えば、進捗状況によって予定の色が変化する点です。<br>
予定テーブルにステータスカラムを持たせることで進捗の入力ができ、着手前は緑、着手後はグレー、途中で終わってしまった場合は黄色といった色分けにより、予定が完了しているか見分けやすいような工夫を施しました。<br>
また、自身の学習時間を把握できた方がモチベーションに繋がる方も多いと考えたため、設計段階では実装予定のなかった打刻システムを実装いたしました。
時間を扱うデータ型のため、合計時間をどのようなデータ型で保存すれば良いのかなど悩むことは多かったですが無事実装でき、使用してみるとやはり必要であったと思うことができたためユーザビリティが向上したと考えております。<br>
他には新規予定を作成する際に、クリックされた日付を取得してセレクトフォームに反映するななど、様々なユーザーが使用する際に直感的に操作できるかという点も重視して制作いたしました。

### 完成までのプロセス
まず、カレンダーアプリを制作するにあたり"simple-calendar"というGemがあることを知りましたが、初めて使用するGemのためいきなり実装するのではなくまずは参考記事や公式のGitHubを確認し、試しに触ってみることで
どのようなカラムが必要なのか、どのように使用できるのかという確認を行いました。そしてGemへの理解が深まった後に画面設計→データベース設計→アプリケーション詳細設計→開発→テストという工程で制作いたしました。


## 設計書
- ER図<br>
  https://drive.google.com/file/d/1n9D12W1HsOHpMJIPOuJEuvdvt6ucAtmL/view?usp=sharing
- テーブル提議書<br>
  https://docs.google.com/spreadsheets/d/1j_V5mR8ChVG__ZnijJwS6PMHy_LmfW74t_zxkxiGyJE/edit?usp=sharing
- アプリケーション詳細設計書<br>
  https://docs.google.com/spreadsheets/d/18jmSoD-X0FiZKuvG0ot5h1hV15VmzXvl/edit?usp=sharing&ouid=117174015654615395157&rtpof=true&sd=true
- テスト仕様書
- https://docs.google.com/spreadsheets/d/1fpJwYml04QclvjIFspEZ8LueCWYsndQx/edit?usp=sharing&ouid=117174015654615395157&rtpof=true&sd=true

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9