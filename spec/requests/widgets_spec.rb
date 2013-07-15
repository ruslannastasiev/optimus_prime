require 'spec_helper'

describe "Widgets" do
  let(:test_page) { create :page }  
  let!(:widget) { create :widget, page: test_page } 

  describe "listing" do

    it "show widgets in list" do      
      visit widgets_path
      expect(page).to have_content(widget.name)
      expect(page).to have_content(widget.content)
      expect(page).to have_content(test_page.id)      
    end

  end

  describe "show single widget" do

    it "show single widget by clicking button" do
      visit widgets_path
      click_link("Show")
      expect(page).to have_content(widget.name)
      expect(page).to have_content(widget.content)
      expect(page).to have_content(test_page.id)
    end

  end

  describe "including" do

    it "show widget in page path" do
      visit page_path(test_page)
      expect(page).to have_content(widget.content)
    end

  end

  describe "create widget" do

    it "fill fields to create widget" do
      visit widgets_path
      click_link("New")
      fill_in :widget_name, with: "new cool widget"
      fill_in :widget_content, with: "new cool content"
      fill_in :widget_page_id, with: test_page.id
      click_button("Create Widget")      
      expect(page).to have_content("new cool widget")
      expect(page).to have_content("new cool content")
      expect(page).to have_content(test_page.id)
    end

  end

  describe "edit widget" do

    it "fill fields to edit widget" do
      visit widgets_path
      click_link("Edit")
      fill_in :widget_name, with: "cool widget"
      fill_in :widget_content, with: "cool content"
      fill_in :widget_page_id, with: test_page.id
      click_button("Update Widget")      
      expect(page).to have_content("cool widget")
      expect(page).to have_content("cool content")
      expect(page).to have_content(test_page.id)   
    end

  end

  describe "delete widget" do

    it "delete widget by clicking button" do
      visit widgets_path
      click_link("Delete")
      expect(page).not_to have_content(widget.name)
      expect(page).not_to have_content(widget.content)
      expect(page).not_to have_content(test_page.id) 
    end

  end

end