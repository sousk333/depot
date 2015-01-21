require 'rails_helper'

feature "Store", js: true do
  feature "トップページ" do
    background do
      @product = create(:product)
      create_list(:product, 2)
      visit store_path
    end

    scenario "商品が表示されていること" do
      expect(page).to have_selector("#columns #side li", count: 4)
      expect(page).to have_selector("#main .entry", count: 3)
      expect(page.all("h3").map(&:text)).to include @product.title
      expect(page.all(".price").first.text).to match /\$[,\d]+\.\d\d/
      save_screenshot(sc_path("store_1.png"))
    end

    scenario "商品が表示されていること", js: true do
      expect(page.all("h3").map(&:text)).to include @product.title
      expect(page.all(".price").first.text).to match /\$[,\d]+\.\d\d/
      save_screenshot(sc_path("store_1.png"))
    end
  end

  feature "カート" do
    background do
      @product = create(:product)
      visit store_path
    end

    scenario "画像クリックでカートに対象商品が入ること" do
      find(".entry img").click
      sleep 2

      expect(find("#current_item")).to \
        have_content /1\s+×\s+#{@product.title}\s+\$#{@product.price}/
      expect(find(".total_cell")).to have_content @product.price
      save_screenshot(sc_path("store_2.png"))
    end
  end
end
