require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
    describe "商品出品機能" do
      context '商品が出品できるとき' do
        it "全てが存在すれば登録できる" do
          expect(@item).to be_valid
        end
      end
    end

    it "タイトルが空では保存できない" do
      @item.title = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end
    it "タイトルが40文字以上は保存できない" do
      @item.title = "'a' * 40"
      @item.valid?
      expect(@item.errors.full_messages).to include
    end

    it "商品説明が空だと保存できない" do
      @item.explanation = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it "商品説明1000文字以上は保存できない" do
      @item.explanation = "'a' * 1001"
      @item.valid?
      expect(@item.errors.full_messages).to include

    end

    it "商品カテゴリーが空では保存できない" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it "商品カテゴリーはid1は保存できない" do
      @item.category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it "商品の状態が空では保存できない" do
      @item.situation_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Situation can't be blank")
    end
    it "商品状態はid1は保存できない" do
      @item.situation_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Situation can't be blank")
    end

    it "配送料の負担が空では保存できない" do
      @item.load_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Load can't be blank", )
    end
    it "配送料の負担はid1は保存できない" do
      @item.load_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Load can't be blank")
    end

    it "発送元の地域が空では保存できない" do
      @item.shipping_origin_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping origin can't be blank")
    end
    it "発送元の地域はid1は保存できない" do
      @item.shipping_origin_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping origin can't be blank")
    end

    it "発送までの日数が空では保存できない" do
      @item.number_of_day_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Number of day can't be blank")
    end
    it "発送までの日数はid1は保存できない" do
      @item.number_of_day_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Number of day can't be blank")
    end

    it "販売価格が空では保存できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "販売価格が¥300より少ない時は保存できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it "販売価格が¥9999999より多い時は出品できないこと" do 
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    it "半角数字でなければ保存できない" do
      @item.price = "ああああああ"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
end

