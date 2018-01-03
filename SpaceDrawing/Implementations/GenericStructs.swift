//
//  GenericStructs.swift
//  DrawTesting
//
//  Created by Dante Broggi on 10/6/17.
//  Copyright © 2017 Dante Broggi. All rights reserved.
//

public enum Defaults<TSpace: DrawSpace> {
    public struct LineDash<Phase: Numeric>: LineDashProto
            where Self == TSpace.Graphics.Line {
        public typealias Space = TSpace
        public typealias PhaseOffset = Phase
        public var phaseOffset: PhaseOffset
        public var pattern: [Space.LinearDisplacement]
    }
    public struct Shadow<Blur: Numeric> : ShadowProto
            where Defaults.Shadow == TSpace.Graphics.Shadow {
        public var color: Defaults<TSpace>.Shadow<Blur>.Space.Graphics.ColorGamut.Point
        
        public var offset: Defaults<TSpace>.Shadow<Blur>.Space.Size
        
        public var blur: Defaults<TSpace>.Shadow<Blur>.BlurAmmount
        
        public typealias Space = TSpace
        public typealias BlurAmmount = Blur
    }
}
