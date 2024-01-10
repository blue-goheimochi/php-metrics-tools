<?php

declare(strict_types=1);

use Rector\CodeQuality\Rector\Class_\InlineConstructorDefaultToPropertyRector;
use Rector\Config\RectorConfig;
use Rector\Set\ValueObject\SetList;

return static function (RectorConfig $rectorConfig): void {
    $rectorConfig->disableParallel();

    $rectorConfig->parallel(maxNumberOfProcess:4);

    $rectorConfig->paths([
        '/app',
    ]);

    $rectorConfig->skip([
        '*/vendor/*',
        '*/storage/*',
        '*/tests/*',
    ]);

    // register a single rule
    $rectorConfig->rule(InlineConstructorDefaultToPropertyRector::class);

    // define sets of rules
//    $rectorConfig->sets([
//        SetList::CODE_QUALITY
//    ]);
};
