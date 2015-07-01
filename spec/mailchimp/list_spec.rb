# encoding: utf-8
require 'spec_helper'
require 'mailchimp'

describe Mailchimp::List, vcr: { cassette_name: 'mailchimp' } do
  let(:lists) { Mailchimp.connect.lists }
  let(:list) { lists.first }

  it 'is the expected class' do
    expect(list).to be_a Mailchimp::List
  end

  it 'has a name' do
    expect(list.name).to eq 'My first list'
  end

  it 'has an id' do
    expect(list.id).to eq 'e73f5910ca'
  end

  it 'has an id + name method' do
    expect(list.id_and_name).to eq 'e73f5910ca___My first list'
  end

  it 'has a members collection' do
    members = list.members
    expect(members).to be_an Array
    expect(members.sample).to be_a Mailchimp::List::Member
  end

  it 'has a interest_categories collection' do
    interest_categories = list.interest_categories
    expect(interest_categories).to be_an Array
    expect(interest_categories.sample).to be_a Mailchimp::List::InterestCategory
  end
end