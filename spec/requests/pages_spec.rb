require 'spec_helper'

describe "Pages" do 

  let!(:test_page) { create :page }
  
  describe "listing" do

    it "show pages in list" do
      visit pages_path
      expect(page).to have_content(test_page.name)
    end

  end

  describe "show single page" do

    it "show single page by clicking button" do
      visit pages_path
      click_link("Show")
      expect(page).to have_content(test_page.name)
    end

  end

  describe "create page" do

    it "fill fields to create page" do
      visit pages_path
      click_link("New")
      fill_in :page_name, with: "news"
      fill_in :page_link, with: "news link"
      fill_in :page_content, with: "text of news"
      click_button("Create Page")
      expect(page).to have_content("news")
    end

  end

  describe "edit page" do 

    it "fill fields to edit page" do
      visit pages_path
      click_link("Edit")
      fill_in :page_name, with: "cool news"
      click_button("Update Page")
      expect(page).to have_content("cool news")
      expect(page).to have_content(test_page.content)
    end

  end

  describe "delete page" do

    it "delete page by clicking button" do
      visit pages_path 
      click_link("Delete")
      expect(page).not_to have_content(test_page.name)
    end

  end

end