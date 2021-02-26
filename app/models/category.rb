class Category < ActiveHash::Base
  self.data = [
    {id: 1, name: "趣味"}, {id: 2, name: "暮らし"}, {id: 3, name: "スポーツ"},
    {id: 4, name: "学習"}, {id: 5, name: "ビジネス"}, {id: 6, name: "音楽"},
    {id: 7, name: "社会"}, {id: 8, name: "芸術"}, {id: 9, name: "文化"}
  ]
end