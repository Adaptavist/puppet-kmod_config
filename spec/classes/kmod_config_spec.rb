require 'spec_helper'

describe 'kmod_config', :type => 'class' do


  context "Should blacklist the rpcsec_gss_krb5 module" do

    let(:params) {
      { :blacklist    =>
        { 'rpcsec_gss_krb5' =>
          { 'ensure' => 'present' }
        }
      }
    }

    it do
      should contain_kmod__blacklist('rpcsec_gss_krb5').with(
          'ensure'  =>   'present'
      )
    end
  end

  context "Should load the rpcsec_gss_krb5 module" do

    let(:params) {
      { :load    =>
        { 'rpcsec_gss_krb5' =>
          { 'ensure' => 'present' }
        }
      }
    }

    it do
      should contain_kmod__load('rpcsec_gss_krb5').with(
          'ensure'  =>   'present'
      )
    end
  end

  context "Should alias the rpcsec_gss_krb5 module to alias_mod" do

    let(:params) {
      { :mod_alias    =>
        { 'alias_mod' =>
          { 'ensure' => 'present',
            'source' => 'rpcsec_gss_krb5'
          }
        }
      }
    }

    it do
      should contain_kmod__alias('alias_mod').with(
          'ensure'  =>   'present',
          'source'  =>   'rpcsec_gss_krb5'
      )
    end
  end

  context "Should install the rpcsec_gss_krb5 module" do

    let(:params) {
      { :install    =>
        { 'rpcsec_gss_krb5' =>
          { 'ensure' => 'present' }
        }
      }
    }

    it do
      should contain_kmod__install('rpcsec_gss_krb5').with(
          'ensure'  =>   'present'
      )
    end
  end

end
