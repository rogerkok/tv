<?php

namespace App\Services\Csp\Policies;

use Spatie\Csp\Keyword;
use Spatie\Csp\Directive;
use Spatie\Csp\Policies\Basic;

class CustomCspPolicy extends Basic
{
    public function configure()
    {
        $this
            ->addGeneralDirectives()
            ->addDirectivesForGoogleFonts()
            ->addDirectivesCDNS();
    }

    protected function addGeneralDirectives(): self
    {
        return $this
            ->addDirective(Directive::BASE, Keyword::SELF)
            ->addDirective(Directive::CONNECT, Keyword::SELF)
            ->addDirective(Directive::
            DEFAULT, Keyword::SELF)
            ->addDirective(Directive::FORM_ACTION, Keyword::SELF)
            ->addDirective(Directive::MANIFEST, Keyword::SELF)
            ->addDirective(Directive::IMG, Keyword::SELF)
            ->addDirective(Directive::MEDIA, Keyword::SELF)
            ->addDirective(Directive::OBJECT, Keyword::NONE)
            ->addDirective(Directive::SCRIPT, Keyword::SELF)
            ->addDirective(Directive::STYLE, Keyword::SELF)
            // ->addNonceForDirective(Directive::SCRIPT)
            ->addDirective(Directive::SCRIPT, [
                Keyword::SELF,
                Keyword::UNSAFE_EVAL,
                Keyword::UNSAFE_INLINE,
                env('JS_DEV_SERVER')
            ])
            ->addDirective(Directive::STYLE, [
                Keyword::SELF,
                Keyword::UNSAFE_INLINE,
                env('JS_DEV_SERVER')
            ])
            ->addDirective(Directive::FRAME, [
                Keyword::SELF,
                'www.youtube.com'
            ])
            ->addDirective(Directive::IMG, [
                Keyword::SELF,
                'solidarityworld.org',
                'www.solidarityworld.org',
                'picsum.photos',
                '*.picsum.photos',
                env('JS_DEV_SERVER'),
                'data:',
            ])
            ->addDirective(Directive::FONT, [
                Keyword::SELF,
                env('JS_DEV_SERVER'),
                'data:',
            ])
            ->addDirective(Directive::WORKER, [
                Keyword::SELF,
                env('JS_DEV_SERVER'),
                'blob:',
            ]);
    }


    protected function addDirectivesForGoogleFonts(): self
    {
        return $this
            ->addDirective(Directive::FONT, 'fonts.gstatic.com')
            ->addDirective(Directive::SCRIPT, 'fonts.googleapis.com')
            ->addDirective(Directive::STYLE, 'fonts.googleapis.com');
    }

    protected function addDirectivesCDNS(): self
    {
        return $this
            ->addDirective(Directive::SCRIPT, [
                'cdnjs.cloudflare.com',
            ])
            ->addDirective(Directive::STYLE, [
                'cdnjs.cloudflare.com',
            ])
            ->addDirective(Directive::FONT, [
                'cdnjs.cloudflare.com'
            ]);
    }
}
