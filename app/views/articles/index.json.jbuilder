# 全情報を取得
json.array! @articles, partial: 'articles/article', as: :article

# 一部の情報のみ取得
# json.array! @articles, :id, :title, :content

# インスタンス変数の要素が一つ & 入れ子にしたい
# json.article @articles, :id, :title, :content

# インスタンス変数の要素が複数 & 入れ子にしたい
# json.articles @articles do |article|
#   json.id article.id
#   json.title article.title
#   json.content article.content
# end

# インスタンス変数の要素を取り出す:extract!
# json.articles do
#   json.array! @articles, :id, :title, :content
# end

# インスタンス変数の要素に新しいハッシュを追加する
# json.articles do
#   json.array! @articles, :id, :title, :content
# end

# json.status "OK"
